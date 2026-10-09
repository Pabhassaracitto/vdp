import { createServer } from 'node:http';
import { GoogleAuth } from 'google-auth-library';

const port = Number(process.env.PORT ?? 8080);
const allowedOrigin = process.env.APP_ORIGIN;
const maximumTextBytes = 5000;
const googleAuth = new GoogleAuth({
  scopes: ['https://www.googleapis.com/auth/cloud-platform'],
});

const vietnameseVoices = new Set([
  'vi-VN-Neural2-A',
  'vi-VN-Neural2-D',
  'vi-VN-Wavenet-A',
  'vi-VN-Wavenet-B',
  'vi-VN-Wavenet-C',
  'vi-VN-Wavenet-D',
]);

function sendJson(response, status, value) {
  response.writeHead(status, {
    'Content-Type': 'application/json; charset=utf-8',
    'Cache-Control': 'no-store',
  });
  response.end(JSON.stringify(value));
}

function applyCors(request, response) {
  const origin = request.headers.origin;
  if (origin && allowedOrigin && origin !== allowedOrigin) return false;
  if (allowedOrigin) {
    response.setHeader('Access-Control-Allow-Origin', allowedOrigin);
    response.setHeader('Vary', 'Origin');
  }
  response.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
  response.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
  response.setHeader('Access-Control-Max-Age', '600');
  return true;
}

async function readJson(request) {
  const chunks = [];
  let size = 0;
  for await (const chunk of request) {
    size += chunk.length;
    if (size > 64 * 1024) throw new Error('Request body is too large.');
    chunks.push(chunk);
  }
  return JSON.parse(Buffer.concat(chunks).toString('utf8'));
}

function resolveVoiceName({ langCode, gender, requestedVoiceName }) {
  if (langCode !== 'vi-VN') return undefined;
  const defaultByGender = {
    MALE: 'vi-VN-Neural2-D',
    FEMALE: 'vi-VN-Neural2-A',
  };
  const candidate = requestedVoiceName || defaultByGender[gender];
  if (candidate && !vietnameseVoices.has(candidate)) {
    throw new Error('Voice is not in the Vietnamese voice allowlist.');
  }
  return candidate;
}

const server = createServer(async (request, response) => {
  if (!applyCors(request, response)) {
    sendJson(response, 403, { error: 'Origin is not allowed.' });
    return;
  }

  if (request.method === 'OPTIONS') {
    response.writeHead(204);
    response.end();
    return;
  }

  if (request.method !== 'POST' || request.url !== '/api/tts') {
    sendJson(response, 404, { error: 'Not found.' });
    return;
  }

  try {
    const body = await readJson(request);
    const text = typeof body.text === 'string' ? body.text.trim() : '';
    const langCode = typeof body.langCode === 'string' ? body.langCode : '';
    const gender = typeof body.gender === 'string' ? body.gender.toUpperCase() : '';

    const textBytes = Buffer.byteLength(text, 'utf8');
    if (!text || textBytes > maximumTextBytes) {
      sendJson(response, 400, { error: `text must contain 1-${maximumTextBytes} UTF-8 bytes.` });
      return;
    }
    if (!/^[a-z]{2,3}(?:-[A-Z]{2})?$/.test(langCode)) {
      sendJson(response, 400, { error: 'langCode must be a BCP-47 language tag.' });
      return;
    }
    if (!['MALE', 'FEMALE', 'NEUTRAL'].includes(gender)) {
      sendJson(response, 400, { error: 'gender must be MALE, FEMALE, or NEUTRAL.' });
      return;
    }
    if (body.provider && body.provider !== 'google') {
      sendJson(response, 501, { error: 'This example configures Google Cloud TTS only.' });
      return;
    }

    const voiceName = resolveVoiceName({
      langCode,
      gender,
      requestedVoiceName: body.voiceName,
    });
    const authClient = await googleAuth.getClient();
    const googleResponse = await authClient.request({
      url: 'https://texttospeech.googleapis.com/v1/text:synthesize',
      method: 'POST',
      data: {
        input: { text },
        voice: {
          languageCode: langCode,
          ...(voiceName ? { name: voiceName } : {}),
          ssmlGender: gender,
        },
        audioConfig: {
          audioEncoding: 'MP3',
          speakingRate: 1.0,
        },
      },
    });

    const audioContent = googleResponse.data?.audioContent;
    if (typeof audioContent !== 'string' || audioContent.length === 0) {
      sendJson(response, 502, { error: 'The TTS provider returned no audio.' });
      return;
    }
    const audio = Buffer.from(audioContent, 'base64');
    response.writeHead(200, {
      'Content-Type': 'audio/mpeg',
      'Content-Length': audio.length,
      'Cache-Control': 'no-store',
      'X-Content-Type-Options': 'nosniff',
    });
    response.end(audio);
  } catch (error) {
    // Do not echo provider credentials or raw upstream request details to users.
    console.error('TTS proxy request failed:', error?.message ?? error);
    sendJson(response, 500, { error: 'TTS request failed. Check the server logs.' });
  }
});

server.listen(port, '0.0.0.0', () => {
  console.log(`Google Cloud TTS proxy listening on 0.0.0.0:${port}`);
});

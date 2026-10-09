const audio = document.querySelector('#tts-audio');
const form = document.querySelector('#tts-form');
const textInput = document.querySelector('#tts-text');
const providerInput = document.querySelector('#tts-provider');
const languageInput = document.querySelector('#tts-language');
const genderInput = document.querySelector('#tts-gender');
const status = document.querySelector('#tts-status');
const pauseButton = document.querySelector('#pause-button');
const stopButton = document.querySelector('#stop-button');

/**
 * Browser client for a same-origin TTS proxy.
 *
 * The server accepts { provider, text, langCode, gender, voiceName } and
 * returns raw audio/mpeg bytes. Credentials and provider-specific network
 * calls stay on the server; this client only owns playback and object URLs.
 */
export class ProxyTtsPlayer {
  constructor({
    audioElement,
    endpoint = '/api/tts',
    onPlay,
    onPause,
    onEnded,
    onError,
  }) {
    this.audio = audioElement;
    this.endpoint = endpoint;
    this.callbacks = { onPlay, onPause, onEnded, onError };
    this.objectUrl = null;
    this.requestId = 0;

    this.audio.addEventListener('play', () => this.callbacks.onPlay?.());
    this.audio.addEventListener('pause', () => this.callbacks.onPause?.());
    this.audio.addEventListener('ended', () => {
      this._releaseUrl();
      this.callbacks.onEnded?.();
    });
    this.audio.addEventListener('error', () => {
      this._releaseUrl();
      this.callbacks.onError?.(
        this.audio.error ?? new Error('The audio element failed to play.'),
      );
    });
  }

  /**
   * Generate and play speech. The proxy should validate/limit text length,
   * allowlist voice names and return Content-Type: audio/mpeg.
   */
  async speak(text, { provider = 'google', langCode = 'vi-VN', gender = 'MALE' } = {}) {
    const content = String(text ?? '').trim();
    if (!content) throw new TypeError('Enter some text to speak.');

    this.stop();
    const requestId = ++this.requestId;
    const voiceName = resolveVoiceName(provider, langCode, gender);

    try {
      const response = await fetch(this.endpoint, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          provider,
          text: content,
          langCode,
          gender,
          ...(voiceName ? { voiceName } : {}),
        }),
      });

      if (!response.ok) {
        const detail = await response.text().catch(() => '');
        throw new Error(detail || `TTS request failed (${response.status}).`);
      }
      if (requestId !== this.requestId) return false;

      const blob = await response.blob();
      if (!blob.type.startsWith('audio/')) {
        throw new Error('The TTS proxy must return an audio/* response.');
      }
      if (requestId !== this.requestId) return false;

      this.objectUrl = URL.createObjectURL(blob);
      this.audio.src = this.objectUrl;
      this.audio.load();
      // This must follow a user action (Play). Browsers may reject autoplay;
      // the catch below routes NotAllowedError through onError.
      await this.audio.play();
      return true;
    } catch (error) {
      if (requestId === this.requestId) {
        this._releaseUrl();
        this.callbacks.onError?.(error);
      }
      return false;
    }
  }

  pause() {
    this.audio.pause();
  }

  stop() {
    // Invalidates an in-flight fetch so a late response cannot restart audio.
    this.requestId += 1;
    this.audio.pause();
    this.audio.removeAttribute('src');
    this._releaseUrl();
  }

  dispose() {
    this.stop();
  }

  _releaseUrl() {
    if (!this.objectUrl) return;
    URL.revokeObjectURL(this.objectUrl);
    this.objectUrl = null;
  }
}

/**
 * Keep voice-name choice deterministic for the requested examples. For all
 * other locales the secure proxy can resolve a voice from langCode + gender.
 */
function resolveVoiceName(provider, langCode, gender) {
  if (langCode !== 'vi-VN') return null;
  if (provider === 'edge') {
    return gender === 'FEMALE'
      ? 'vi-VN-HoaiMyNeural'
      : 'vi-VN-NamMinhNeural';
  }
  if (gender === 'NEUTRAL') return null;
  if (gender === 'FEMALE') return 'vi-VN-Neural2-A';
  return 'vi-VN-Neural2-D';
}

function setStatus(message, state = '') {
  status.textContent = message;
  status.dataset.state = state;
}

const player = new ProxyTtsPlayer({
  audioElement: audio,
  endpoint: '/api/tts',
  onPlay: () => setStatus('Đang phát…', 'playing'),
  onPause: () => {
    if (
      !audio.ended &&
      audio.currentTime > 0 &&
      !['loading', 'stopped'].includes(status.dataset.state)
    ) {
      setStatus('Đã tạm dừng.', 'paused');
    }
  },
  onEnded: () => setStatus('Đã phát xong.', 'ended'),
  onError: (error) => {
    const message = error?.name === 'NotAllowedError'
      ? 'Trình duyệt chặn phát tự động. Hãy nhấn Phát để thử lại.'
      : `Không phát được TTS: ${error?.message ?? 'lỗi không xác định'}`;
    setStatus(message, 'error');
  },
});

form.addEventListener('submit', async (event) => {
  event.preventDefault();
  setStatus('Đang tạo giọng đọc…', 'loading');
  const started = await player.speak(textInput.value, {
    provider: providerInput.value,
    langCode: languageInput.value,
    gender: genderInput.value,
  });
  if (!started && status.dataset.state !== 'error') {
    setStatus('Không phát được âm thanh. Kiểm tra endpoint /api/tts.', 'error');
  }
});

pauseButton.addEventListener('click', () => player.pause());
stopButton.addEventListener('click', () => {
  player.stop();
  setStatus('Đã dừng.', 'stopped');
});

window.addEventListener('pagehide', () => player.dispose(), { once: true });

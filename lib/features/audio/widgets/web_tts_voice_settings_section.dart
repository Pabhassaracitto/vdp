import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/localization/content_languages.dart';
import '../../../core/localization/ui_locale_text.dart';
import '../data/web_tts_voice.dart';
import '../providers/web_tts_voice_settings_provider.dart';

const _automaticVoiceId = '__automatic_browser_voice__';

/// Browser-only voice picker for the app's existing flutter_tts playback.
///
/// `flutter_tts` uses the browser's Web Speech API on Flutter Web; this widget
/// exposes the voices currently installed/available to that browser and stores
/// the user's choice per study-content language.
class WebTtsVoiceSettingsSection extends ConsumerStatefulWidget {
  const WebTtsVoiceSettingsSection({super.key});

  @override
  ConsumerState<WebTtsVoiceSettingsSection> createState() =>
      _WebTtsVoiceSettingsSectionState();
}

class _WebTtsVoiceSettingsSectionState
    extends ConsumerState<WebTtsVoiceSettingsSection> {
  String _contentLocaleTag = 'vi';

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(webTtsVoiceSettingsProvider);
    final notifier = ref.read(webTtsVoiceSettingsProvider.notifier);
    final language = selectableContentLanguages.firstWhere(
      (item) => item.tag == _contentLocaleTag,
      orElse: () => selectableContentLanguages.first,
    );
    final voices = webTtsVoicesForLocale(
      settings.voices,
      language.tag,
    );
    final savedVoice = settings.selectionFor(language.tag);
    final selectedVoice = savedVoice == null
        ? null
        : _findVoice(voices, savedVoice.id);
    // The voice that automatic mode resolves to — the same function the
    // lesson player uses, so the label matches what will actually be heard.
    final automaticVoice = resolveWebTtsVoice(
      voices: settings.voices,
      contentLocaleTag: language.tag,
    );
    final isVietnamese = ttsLanguageCode(language.tag) == 'vi';
    final showNoMaleWarning = isVietnamese &&
        !settings.isLoading &&
        voices.isNotEmpty &&
        selectedVoice == null &&
        !hasIdentifiableVietnameseMaleVoice(voices);

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 2, 20, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _copy(context, 'title'),
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            _copy(context, 'subtitle'),
            style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: language.tag,
            isExpanded: true,
            decoration: InputDecoration(
              labelText: _copy(context, 'language'),
              border: const OutlineInputBorder(),
              isDense: true,
            ),
            items: [
              for (final item in selectableContentLanguages)
                DropdownMenuItem<String>(
                  value: item.tag,
                  child: Text(
                    item.safeDisplayName,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ],
            onChanged: (value) {
              if (value != null) setState(() => _contentLocaleTag = value);
            },
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField<String>(
            value: selectedVoice?.id ?? _automaticVoiceId,
            isExpanded: true,
            decoration: InputDecoration(
              labelText: _copy(context, 'voice'),
              border: const OutlineInputBorder(),
              isDense: true,
            ),
            items: [
              DropdownMenuItem<String>(
                value: _automaticVoiceId,
                child: Text(
                  automaticVoice == null
                      ? _copy(context, 'automatic')
                      : '${_copy(context, 'automatic')} → '
                          '${automaticVoice.name}',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              for (final voice in voices)
                DropdownMenuItem<String>(
                  value: voice.id,
                  child: Text(
                    _voiceLabel(voice, language.tag),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ],
            onChanged: settings.isLoading || settings.isSaving
                ? null
                : (value) {
                    final voice = value == _automaticVoiceId
                        ? null
                        : _findVoice(voices, value ?? '');
                    notifier.selectVoice(
                      contentLocaleTag: language.tag,
                      voice: voice,
                    );
                  },
          ),
          if (settings.isLoading) ...[
            const SizedBox(height: 10),
            const LinearProgressIndicator(minHeight: 2),
          ],
          if (showNoMaleWarning) ...[
            const SizedBox(height: 8),
            Text(
              _copy(context, 'noMaleVoice'),
              style: TextStyle(
                fontSize: 12,
                color: Colors.orange.shade900,
              ),
            ),
          ],
          if (!settings.isLoading && voices.isEmpty) ...[
            const SizedBox(height: 8),
            Text(
              _copy(
                context,
                settings.voices.isEmpty ? 'noVoices' : 'noVoiceForLanguage',
              ),
              style: TextStyle(
                fontSize: 12,
                color: Colors.orange.shade900,
              ),
            ),
          ],
          const SizedBox(height: 8),
          Text(
            _copy(context, 'note'),
            style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
          ),
          if (settings.error != null) ...[
            const SizedBox(height: 8),
            Text(
              _copy(context, _errorCopyKey(settings.error)),
              style: TextStyle(fontSize: 12, color: Colors.red.shade700),
            ),
          ],
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              OutlinedButton.icon(
                onPressed: settings.isLoading ? null : notifier.refresh,
                icon: const Icon(Icons.refresh_rounded, size: 18),
                label: Text(_copy(context, 'refresh')),
              ),
              FilledButton.tonalIcon(
                onPressed: settings.isLoading || settings.isPreviewing
                    ? null
                    : () async {
                        final didPlay = await notifier.preview(language.tag);
                        if (!mounted || didPlay) return;
                        final error =
                            ref.read(webTtsVoiceSettingsProvider).error;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              _copy(context, _errorCopyKey(error)),
                            ),
                          ),
                        );
                      },
                icon: settings.isPreviewing
                    ? const SizedBox.square(
                        dimension: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.play_arrow_rounded, size: 18),
                label: Text(_copy(context, 'preview')),
              ),
            ],
          ),
        ],
      ),
    );
  }

  WebTtsVoice? _findVoice(Iterable<WebTtsVoice> voices, String id) {
    for (final voice in voices) {
      if (voice.id == id) return voice;
    }
    return null;
  }

  /// Gender is shown only when it is KNOWN (explicit metadata or a known
  /// Vietnamese voice). Unknown voices get no label — never "male" by guess.
  String _voiceLabel(WebTtsVoice voice, String contentLocaleTag) {
    final genderLabel = switch (voice.genderHint) {
      WebTtsVoiceGender.male => ' · ${_copy(context, 'male')}',
      WebTtsVoiceGender.female => ' · ${_copy(context, 'female')}',
      WebTtsVoiceGender.unknown => '',
    };
    return '${voice.name} · ${voice.locale}$genderLabel';
  }

  String _errorCopyKey(String? error) => switch (error) {
        WebTtsVoiceErrors.listUnavailable => 'voiceListFailed',
        WebTtsVoiceErrors.noVoiceForLanguage => 'noVoiceForLanguage',
        _ => 'previewFailed',
      };

  String _copy(BuildContext context, String key) => localizedUiText(
        context,
        _webTtsCopy[key]!,
      );
}

const Map<String, Map<String, String>> _webTtsCopy = {
  'title': {
    'en': 'Browser voice',
    'vi': 'Giọng đọc trình duyệt',
    'ja': 'ブラウザーの音声',
    'zh': '浏览器语音',
    'zh_TW': '瀏覽器語音',
    'my': 'ဘရောက်ဇာအသံ',
  },
  'subtitle': {
    'en': 'Choose a voice for each study language. The list depends on your browser and device.',
    'vi': 'Chọn giọng cho từng ngôn ngữ bài học. Danh sách tùy theo trình duyệt và thiết bị.',
    'ja': '学習言語ごとに音声を選択します。表示される音声はブラウザーと端末によって異なります。',
    'zh': '为每种学习语言选择语音。可用列表取决于浏览器和设备。',
    'zh_TW': '為每種學習語言選擇語音。可用清單取決於瀏覽器和裝置。',
    'my': 'သင်ခန်းစာဘာသာစကားတိုင်းအတွက် အသံရွေးပါ။ စာရင်းသည် ဘရောက်ဇာနှင့် စက်ပေါ်မူတည်ပါသည်။',
  },
  'language': {
    'en': 'Study language',
    'vi': 'Ngôn ngữ bài học',
    'ja': '学習言語',
    'zh': '学习语言',
    'zh_TW': '學習語言',
    'my': 'သင်ခန်းစာဘာသာစကား',
  },
  'voice': {
    'en': 'Voice',
    'vi': 'Giọng đọc',
    'ja': '音声',
    'zh': '语音',
    'zh_TW': '語音',
    'my': 'အသံ',
  },
  'automatic': {
    'en': 'Automatic (prefer male for Vietnamese)',
    'vi': 'Tự động (ưu tiên giọng Nam cho tiếng Việt)',
    'ja': '自動（ベトナム語では男性音声を優先）',
    'zh': '自动（越南语优先男声）',
    'zh_TW': '自動（越南語優先男聲）',
    'my': 'အလိုအလျောက် (ဗီယက်နမ်ဘာသာအတွက် အမျိုးသားအသံကို ဦးစားပေး)',
  },
  'noVoices': {
    'en': 'No browser voices found. Install a voice for this language in your operating system, then refresh.',
    'vi': 'Không tìm thấy giọng đọc. Hãy cài giọng cho ngôn ngữ này trong hệ điều hành rồi tải lại.',
    'ja': 'ブラウザーの音声が見つかりません。OSに音声をインストールしてから再読み込みしてください。',
    'zh': '未找到浏览器语音。请先在操作系统中安装语音，然后刷新。',
    'zh_TW': '找不到瀏覽器語音。請先在作業系統中安裝語音，然後重新整理。',
    'my': 'ဘရောက်ဇာအသံ မတွေ့ပါ။ စက်လည်ပတ်မှုစနစ်တွင် အသံထည့်သွင်းပြီး ပြန်လည်စတင်ပါ။',
  },
  'noVoiceForLanguage': {
    'en': 'This browser has no voice for the selected language. Install one in your operating system (or use another browser), then refresh.',
    'vi': 'Trình duyệt này không có giọng cho ngôn ngữ đã chọn. Hãy cài giọng trong hệ điều hành (hoặc dùng trình duyệt khác) rồi tải lại.',
    'ja': 'このブラウザーには選択した言語の音声がありません。OSに音声をインストールする（または別のブラウザーを使う）と、更新後に利用できます。',
    'zh': '此浏览器没有所选语言的语音。请在操作系统中安装语音（或换用其他浏览器），然后刷新。',
    'zh_TW': '此瀏覽器沒有所選語言的語音。請在作業系統中安裝語音（或改用其他瀏覽器），然後重新整理。',
    'my': 'ဤဘရောက်ဇာတွင် ရွေးထားသောဘာသာစကားအတွက် အသံမရှိပါ။ စက်လည်ပတ်မှုစနစ်တွင် အသံထည့်သွင်းပါ (သို့မဟုတ် အခြားဘရောက်ဇာသုံးပါ)၊ ပြီးနောက် ပြန်ဖတ်ပါ။',
  },
  'noMaleVoice': {
    'en': 'No identifiable male Vietnamese voice is available in this browser, so automatic mode uses the voice shown above. Web Speech cannot add voices; install one (e.g. Microsoft NamMinh in Edge) or configure a TTS proxy.',
    'vi': 'Trình duyệt này không cung cấp giọng Nam tiếng Việt nhận diện được, nên chế độ tự động dùng giọng hiển thị ở trên. Web Speech không thể tự thêm giọng; hãy cài giọng (vd. Microsoft NamMinh trên Edge) hoặc cấu hình TTS proxy.',
    'ja': 'このブラウザーには識別可能なベトナム語の男性音声がないため、自動モードは上に表示された音声を使います。Web Speech では音声を追加できません。音声をインストールする（例：Edge の Microsoft NamMinh）か、TTS プロキシを設定してください。',
    'zh': '此浏览器没有可识别的越南语男声，因此自动模式使用上方显示的语音。Web Speech 无法自行添加语音；请安装语音（如 Edge 中的 Microsoft NamMinh）或配置 TTS 代理。',
    'zh_TW': '此瀏覽器沒有可辨識的越南語男聲，因此自動模式使用上方顯示的語音。Web Speech 無法自行新增語音；請安裝語音（如 Edge 中的 Microsoft NamMinh）或設定 TTS 代理。',
    'my': 'ဤဘရောက်ဇာတွင် ခွဲခြားသိနိုင်သော ဗီယက်နမ် အမျိုးသားအသံ မရှိသဖြင့် အလိုအလျောက်မုဒ်သည် အထက်ပါအသံကို သုံးပါသည်။ Web Speech သည် အသံအသစ် မထည့်နိုင်ပါ၊ အသံထည့်သွင်းပါ (ဥပမာ Edge ရှိ Microsoft NamMinh) သို့မဟုတ် TTS proxy ကို သတ်မှတ်ပါ။',
  },
  'voiceListFailed': {
    'en': 'Could not load this browser’s voice list. Try refreshing, or use the automatic voice.',
    'vi': 'Không đọc được danh sách giọng của trình duyệt. Hãy thử tải lại hoặc dùng giọng tự động.',
    'ja': 'ブラウザーの音声一覧を読み込めませんでした。更新するか、自動音声をお試しください。',
    'zh': '无法读取浏览器语音列表。请刷新或使用自动语音。',
    'zh_TW': '無法讀取瀏覽器語音清單。請重新整理或使用自動語音。',
    'my': 'ဘရောက်ဇာ၏ အသံစာရင်းကို ဖတ်၍မရပါ။ ပြန်လည်ဖတ်ပါ သို့မဟုတ် အလိုအလျောက်အသံကို သုံးပါ။',
  },
  'note': {
    'en': 'Uses voices provided by this browser/device. Browsers do not report voice gender; a male/female tag is shown only for known voices.',
    'vi': 'Dùng giọng do trình duyệt/thiết bị cung cấp. Trình duyệt không báo giới tính giọng; nhãn Nam/Nữ chỉ hiện với các giọng đã biết.',
    'ja': 'このブラウザー／端末が提供する音声を使用します。ブラウザーは音声の性別を報告しないため、男性／女性の表示は既知の音声にのみ付きます。',
    'zh': '使用浏览器/设备提供的语音。浏览器不提供语音性别信息，仅对已知语音标注男声/女声。',
    'zh_TW': '使用瀏覽器／裝置提供的語音。瀏覽器不提供語音性別資訊，僅對已知語音標示男聲／女聲。',
    'my': 'ဤဘရောက်ဇာ/စက်မှ ပံ့ပိုးသောအသံကို သုံးပါသည်။ ဘရောက်ဇာများသည် အသံ၏လိင်ကို မဖော်ပြသဖြင့် သိရှိပြီးသားအသံများအတွက်သာ အမျိုးသား/အမျိုးသမီး ဟု ပြပါသည်။',
  },
  'refresh': {
    'en': 'Refresh voices',
    'vi': 'Tải lại danh sách giọng',
    'ja': '音声を更新',
    'zh': '刷新语音',
    'zh_TW': '重新整理語音',
    'my': 'အသံစာရင်း ပြန်ဖတ်ရန်',
  },
  'preview': {
    'en': 'Preview',
    'vi': 'Nghe thử',
    'ja': '試聴',
    'zh': '试听',
    'zh_TW': '試聽',
    'my': 'နားထောင်စမ်းရန်',
  },
  'previewFailed': {
    'en': 'The preview did not start. Check browser audio permissions and try again.',
    'vi': 'Không phát được giọng mẫu. Hãy kiểm tra quyền âm thanh của trình duyệt rồi thử lại.',
    'ja': '音声を再生できませんでした。ブラウザーの音声権限を確認して、もう一度お試しください。',
    'zh': '无法播放语音示例。请检查浏览器音频权限后重试。',
    'zh_TW': '無法播放語音範例。請檢查瀏覽器音訊權限後重試。',
    'my': 'အသံကို ဖွင့်၍မရပါ။ ဘရောက်ဇာအသံခွင့်ပြုချက်ကို စစ်ဆေးပြီး ထပ်ကြိုးစားပါ။',
  },
  'male': {
    'en': 'male',
    'vi': 'Nam',
    'ja': '男性',
    'zh': '男声',
    'zh_TW': '男聲',
    'my': 'အမျိုးသား',
  },
  'female': {
    'en': 'female',
    'vi': 'Nữ',
    'ja': '女性',
    'zh': '女声',
    'zh_TW': '女聲',
    'my': 'အမျိုးသမီး',
  },
};

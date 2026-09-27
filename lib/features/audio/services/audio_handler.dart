import 'package:audio_service/audio_service.dart';

/// Thin OS-media bridge. AudioPlayerNotifier remains the sole source of
/// playback state; this handler forwards commands and never owns a playlist.
class VdpAudioHandler extends BaseAudioHandler with SeekHandler {
  VdpAudioHandler({required this.onPlay, required this.onPause, required this.onNext,
      required this.onPrevious, required this.onSeek}) {
    playbackState.add(playbackState.value.copyWith(
      controls: const [MediaControl.skipToPrevious, MediaControl.play,
        MediaControl.pause, MediaControl.skipToNext],
      systemActions: const {MediaAction.seek},
      processingState: AudioProcessingState.ready,
    ));
  }

  final Future<void> Function() onPlay;
  final Future<void> Function() onPause;
  final Future<void> Function() onNext;
  final Future<void> Function() onPrevious;
  final Future<void> Function(Duration) onSeek;

  @override Future<void> play() => onPlay();
  @override Future<void> pause() => onPause();
  @override Future<void> skipToNext() => onNext();
  @override Future<void> skipToPrevious() => onPrevious();
  @override Future<void> seek(Duration position) => onSeek(position);

  void publish({required bool playing, required String title, String? album,
      Duration? duration, Duration? position}) {
    mediaItem.add(MediaItem(id: title, title: title, album: album, duration: duration));
    playbackState.add(playbackState.value.copyWith(
      playing: playing, updatePosition: position ?? Duration.zero,
      processingState: AudioProcessingState.ready,
    ));
  }
}

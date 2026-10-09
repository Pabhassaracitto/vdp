import 'track_player.dart';
import 'tts_track_player.dart';

/// Flutter Web uses the browser's SpeechSynthesis engine through flutter_tts.
TrackPlayer createDefaultTrackPlayer() => TtsTrackPlayer();

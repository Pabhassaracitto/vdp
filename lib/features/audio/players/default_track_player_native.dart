import 'sherpa_tts_track_player.dart';
import 'track_player.dart';

/// Native builds retain the Sherpa → system TTS fallback player.
TrackPlayer createDefaultTrackPlayer() => SherpaTtsTrackPlayer();

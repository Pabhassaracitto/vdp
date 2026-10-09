import 'default_track_player_web.dart'
    if (dart.library.io) 'default_track_player_native.dart' as platform;
import 'track_player.dart';

/// Creates the platform's default TTS player without pulling native file I/O
/// (`dart:io`, path_provider and just_audio) into the browser build.
TrackPlayer createDefaultTrackPlayer() => platform.createDefaultTrackPlayer();

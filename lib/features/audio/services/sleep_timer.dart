import 'dart:async';

/// Session-owned sleep timer. It fades volume before pausing and restores it
/// on the next play; it is deliberately independent of any bottom sheet.
class SleepTimer {
  SleepTimer({
    required Future<void> Function(double volume) setVolume,
    required Future<void> Function() pause,
    DateTime Function()? now,
    void Function()? onFinished,
  })  : _setVolume = setVolume,
        _pause = pause,
        _onFinished = onFinished,
        _now = now ?? DateTime.now;

  final Future<void> Function(double) _setVolume;
  final Future<void> Function() _pause;
  final DateTime Function() _now;
  final void Function()? _onFinished;
  Timer? _timer;
  DateTime? _deadline;
  double _previousVolume = 1.0;
  bool _fading = false;

  Duration? get remaining {
    final deadline = _deadline;
    if (deadline == null) return null;
    final value = deadline.difference(_now());
    return value.isNegative ? Duration.zero : value;
  }
  bool get isActive => _deadline != null;

  void start(Duration duration) {
    if (duration <= Duration.zero) return cancel();
    cancel();
    _deadline = _now().add(duration);
    _timer = Timer(duration, _fadeAndPause);
  }

  void cancel() {
    _timer?.cancel();
    _timer = null;
    _deadline = null;
    _fading = false;
  }

  Future<void> restoreVolume() async {
    if (_previousVolume != 1.0) {
      await _setVolume(_previousVolume);
      _previousVolume = 1.0;
    }
  }

  Future<void> _fadeAndPause() async {
    if (_fading || _deadline == null) return;
    _fading = true;
    try {
      // Three small steps avoid relying on an engine-specific fade API.
      _previousVolume = 1.0;
      for (final value in [0.66, 0.33, 0.0]) {
        await Future<void>.delayed(const Duration(seconds: 1));
        await _setVolume(value);
      }
      await _pause();
      _onFinished?.call();
    } finally {
      _timer = null;
      _deadline = null;
      _fading = false;
    }
  }

  void dispose() => cancel();
}

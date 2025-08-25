import 'dart:async';
import 'package:pedometer/pedometer.dart';

class StepTracker {
  static final StepTracker _instance = StepTracker._internal();
  factory StepTracker() => _instance;
  StepTracker._internal();

  late Stream<StepCount> _stepStream;
  StreamSubscription<StepCount>? _subscription;

  int _startSteps = 0;
  int _currentSteps = 0;
  bool _isTracking = false;
  bool _isPaused = false;

  Duration _activeDuration = Duration.zero;
  final Stopwatch _stopwatch = Stopwatch();

  final StreamController<int> _stepCountController =
      StreamController<int>.broadcast();
  Stream<int> get stepCountStream => _stepCountController.stream;

  int get stepCount => _currentSteps - _startSteps;
  bool get isPaused => _isPaused;
  Duration get activeDuration => _activeDuration;

  void startTracking() {
    if (_isTracking) return;

    _stepStream = Pedometer.stepCountStream;
    _subscription = _stepStream.listen(
      (StepCount count) {
        if (!_isTracking) {
          _startSteps = count.steps;
          _isTracking = true;
          _stopwatch.start();
        }
        if (!_isPaused) {
          _currentSteps = count.steps;
          _stepCountController.add(stepCount);
        }
      },
      onError: (error) => print("Step error: $error"),
      cancelOnError: true,
    );
  }

  void pauseTracking() {
    _isPaused = true;
    _stopwatch.stop();
  }

  void resumeTracking() {
    _isPaused = false;
    _stopwatch.start();
  }

  void stopTracking() {
    _stopwatch.stop();
    _activeDuration = _stopwatch.elapsed;
    _stopwatch.reset();
    _subscription?.cancel();
    _isTracking = false;
    _isPaused = false;
    _stepCountController.close();
  }
}

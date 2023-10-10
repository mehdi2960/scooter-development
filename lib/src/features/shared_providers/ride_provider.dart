import 'package:custom_logger/custom_logger.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

class RideProvider extends SafeChangeNotifier {
  bool _isRiding = false;
  bool get isRiding => _isRiding;

  void startRide() {
    _isRiding = true;
    customPrint(data: _isRiding, name: 'start ride');
    notifyListeners();
  }

  void stopRide() {
    _isRiding = false;
    customPrint(data: _isRiding, name: 'stop ride');
    notifyListeners();
  }
}

import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:scooter/src/models/scooter.dart';

class VehicleProvider extends SafeChangeNotifier {
  List<Scooter> vehicles = <Scooter>[];

  void clearVehicles() {
    vehicles.clear();
  }

  void addVehicles(Scooter newVehicle) {
    vehicles.add(newVehicle);
    notifyListeners();
  }
}

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:scooter/src/features/shared_providers/ride_provider.dart';
import 'theme_provider.dart';
import 'vehicle_provider.dart';

class GlobalProviders {
  GlobalProviders._();
  static List<SingleChildWidget> providers = <SingleChildWidget>[
    ListenableProvider<ThemeProvider>.value(value: ThemeProvider()),
    ListenableProvider<VehicleProvider>.value(value: VehicleProvider()),
    ListenableProvider<RideProvider>.value(value: RideProvider()),
  ];
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:scooter/src/features/ride_history/provider/ride_history_provider.dart';
import 'package:scooter/src/features/ride_history/widgets/empty_ride_history.dart';
import 'package:scooter/src/features/ride_history/widgets/ride_history_cart.dart';
import '../../../constants/strings.dart';
import '../../shared_widgets/taal_new_app_bar.dart';

class RideHistoryScreen extends StatelessWidget {
  const RideHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RideHistoryProvider>(
      create: (_) => RideHistoryProvider(),
      child: const _RideHistoryScreen(),
    );
  }
}

class _RideHistoryScreen extends StatelessWidget {
  const _RideHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RideHistoryProvider watch = context.watch<RideHistoryProvider>();
    final RideHistoryProvider read = context.read<RideHistoryProvider>();

    return Scaffold(
        appBar: TaalNewAppBar(
          title: Strings.rideHistory,
          forwardOnPress: () => context.pop(),
        ),
        body: read.isLoading!
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : watch.listHistoryModel.data!.isEmpty
                ? const EmptyRideHistory()
                : SizedBox(
                    child: ListView.builder(
                      itemCount: watch.listHistoryModel.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return RideHistoryCart(
                          origin: watch.listHistoryModel.data![index].startAddr,
                          destination:
                              watch.listHistoryModel.data![index].endAddr,
                          price: watch.listHistoryModel.data![index].cost
                              .toString(),
                          calendar: watch
                              .listHistoryModel.data![index].startTime
                              .toString(),
                          time: watch.listHistoryModel.data![index].startTime
                              .toString(),
                        );
                      },
                    ),
                  ));
  }
}

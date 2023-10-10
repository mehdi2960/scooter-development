import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scooter/src/constants/strings.dart';
import 'package:scooter/src/constants/styles/colors.dart';
import 'package:scooter/src/constants/styles/sizes.dart';
import 'package:scooter/src/features/payment_history/widgets/payment_history_cart.dart';

class PaymentHistoryScreen extends StatelessWidget {
  const PaymentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Strings.paymentHistory),
          centerTitle: true,
          leading: Container(),
          actions: <Widget>[
            IconButton(
                onPressed: () => context.pop(), icon: const Icon(Icons.close))
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Container(
              color: AppColors.historyCartBGColor,
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.m),
                  color: Colors.grey[200],
                ),
                child: TabBar(
                  dividerColor: AppColors.primaryWhite,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: AppColors.historyCartBGColor,
                  unselectedLabelColor: AppColors.blackWithAlpha,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(Sizes.s),
                    color: AppColors.primary,
                  ),
                  tabs: const <Widget>[
                    Tab(
                      text: Strings.unsuccessPay,
                    ),
                    Tab(
                      text: Strings.successPay,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            //Tab1
            Column(
              children: <Widget>[
                PaymentHistoryCart(
                  price: '98000',
                  time: '10:50',
                  date: '1402/07/10',
                  isUnSuccess: true,
                ),
                PaymentHistoryCart(
                    price: '98000',
                    time: '10:50',
                    date: '1402/07/10',
                    isUnSuccess: true),
                PaymentHistoryCart(
                    price: '98000',
                    time: '10:50',
                    date: '1402/07/10',
                    isUnSuccess: true),
              ],
            ),

            //Tab2
            Column(
              children: <Widget>[
                PaymentHistoryCart(
                    price: '98000', time: '10:50', date: '1402/07/10'),
                PaymentHistoryCart(
                    price: '98000', time: '10:50', date: '1402/07/10'),
                PaymentHistoryCart(
                    price: '98000', time: '10:50', date: '1402/07/10'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

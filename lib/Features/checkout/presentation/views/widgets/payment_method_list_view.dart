import 'package:checkout_app/Features/checkout/presentation/views/widgets/paymen_method_item.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';

class PaymentMethodListView extends StatefulWidget {
  const PaymentMethodListView({super.key});

  @override
  State<PaymentMethodListView> createState() => _PaymentMethodListViewState();
}

class _PaymentMethodListViewState extends State<PaymentMethodListView> {
  final List<String> paymentMethodsItems = const [
    'assets/images/card.svg',
    'assets/images/paypal.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: activeIndexNotifier,
      builder: (context, activeIndex, _) {
        return SizedBox(
          height: 62,
          child: ListView.builder(
            itemCount: paymentMethodsItems.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GestureDetector(
                  onTap: () {
                    activeIndexNotifier.value = index;
                  },
                  child: PaymentMethodItem(
                    isActive: activeIndex == index,
                    image: paymentMethodsItems[index],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}



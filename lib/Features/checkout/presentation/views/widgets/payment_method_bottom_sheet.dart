import 'package:checkout_app/Features/checkout/presentation/views/widgets/payment_method_list_view.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/widgets/custom_elevated_button.dart';
import 'custom_button_bloc_consumer.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          PaymentMethodListView(),
          const SizedBox(
            height: 32,
          ),
          CustomButtonBlocConsumer(),
        ],
      ),
    );
  }
}

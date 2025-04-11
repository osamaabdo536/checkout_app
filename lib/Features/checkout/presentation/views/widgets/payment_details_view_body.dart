import 'package:checkout_app/Features/checkout/presentation/views/thank_you_view.dart';
import 'package:checkout_app/Features/checkout/presentation/views/widgets/payment_method_list_view.dart';
import 'package:checkout_app/core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'custom_credit_card.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: PaymentMethodListView()),
        SliverToBoxAdapter(
          child: CustomCreditCard(
            formKey: formKey,
            autovalidateMode: autovalidateMode,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            child: CustomElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return ThankYouView();
                      },
                    ),
                  );
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              text: "Pay",
            ),
          ),
        ),
      ],
    );
  }
}

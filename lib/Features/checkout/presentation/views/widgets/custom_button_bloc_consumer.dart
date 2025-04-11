import 'package:checkout_app/Features/checkout/domain/entity/payment_entity.dart';
import 'package:checkout_app/Features/checkout/presentation/cubit/payment_cubit.dart';
import 'package:checkout_app/Features/checkout/presentation/views/thank_you_view.dart';
import 'package:checkout_app/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return ThankYouView();
              },
            ),
          );
        }
        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(content: Text(state.errorMess));
          print(state.errorMess);
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomElevatedButton(
          isLoading: state is PaymentLoading ? true : false,
          onPressed: () {
            BlocProvider.of<PaymentCubit>(context).makePayment(
              amount: 51 * 100,
              currency: "USD",
              customerId: customerId,
            );
          },
          text: "Continue",
        );
      },
    );
  }
}

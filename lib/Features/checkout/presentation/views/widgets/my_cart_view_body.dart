import 'package:checkout_app/Features/checkout/data/repos/check_out_repo_impl.dart';
import 'package:checkout_app/Features/checkout/presentation/cubit/payment_cubit.dart';
import 'package:checkout_app/Features/checkout/presentation/views/widgets/payment_method_bottom_sheet.dart';
import 'package:checkout_app/Features/checkout/presentation/views/widgets/total_price_item.dart';
import 'package:checkout_app/core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/Dependency_Injection.dart';
import 'order_info_item.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.001),
            Expanded(child: Image.asset('assets/images/basket_image.png')),
            SizedBox(height: screenHeight * 0.01),
            OrderInfoItem(title: "Order Subtotal", value: r"$42.97"),
            SizedBox(height: screenHeight * 0.001),
            OrderInfoItem(title: "Discount", value: r"$0"),
            SizedBox(height: screenHeight * 0.001),
            OrderInfoItem(title: "Shipping", value: r"$8"),
            Divider(
              thickness: 2,
              height: screenHeight * 0.03,
              color: Color(0xffC7C7C7),
            ),
            TotalPriceItem(title: "Total", value: r"$50.97"),
            SizedBox(height: screenHeight * 0.02),
            CustomElevatedButton(
              onPressed: () {
                showModalBottomSheet(context: context, builder: (context) {
                  return BlocProvider(
                    create: (context) => sl<PaymentCubit>(),
                    child: PaymentMethodsBottomSheet(),
                  );
                });
              },
              text: "Complete Payment",
            ),
            SizedBox(height: screenHeight * 0.02),
          ],
        ),
      ),
    );
  }
}


import 'package:checkout_app/Features/checkout/presentation/views/widgets/thank_you_card.dart';
import 'package:flutter/material.dart';
import 'custom_check_icon.dart';
import 'custom_dashed_line.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ThankYouCard(),
          /// radius = 20 in flutter
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * .2 + 20,
            left: 20 + 8,
            right: 20 + 8,
            child: CustomDashedLine(),
          ),
          Positioned(
            left: -20,
            bottom: MediaQuery.sizeOf(context).height * .2,
            child: const CircleAvatar(backgroundColor: Colors.white),
          ),
          Positioned(
            right: -20,
            bottom: MediaQuery.sizeOf(context).height * .2,
            child: const CircleAvatar(backgroundColor: Colors.white),
          ),
          Positioned(
            top: -50,
            right: 0,
            left: 0,
            child: CustomCheckIcon(),
          ),
        ],
      ),
    );
  }
}
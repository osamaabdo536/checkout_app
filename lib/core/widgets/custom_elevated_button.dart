import 'package:checkout_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.buttonColor = const Color(0xFF34A853),
    this.isLoading = false,
  });
  final VoidCallback? onPressed;
  final String text;
  final Color buttonColor;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(
          MediaQuery.of(context).size.width * 0.9,
          MediaQuery.of(context).size.height * 0.08,
        ),
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child:
          isLoading
              ? CircularProgressIndicator()
              : Text(text, style: Styles.style22),
    );
  }
}

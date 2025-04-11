import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles.dart';

class TotalPriceItem extends StatelessWidget {
  const TotalPriceItem({super.key, required this.title, required this.value});
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Styles.style24, textAlign: TextAlign.center),
        Text(value, style: Styles.style24, textAlign: TextAlign.center),
      ],
    );
  }
}

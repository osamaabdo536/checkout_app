import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundColor: Color(0xFFD9D9D9),
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Color(0xFF34A853),
        child: SvgPicture.asset("assets/images/check.svg"),
      ),
    );
  }
}
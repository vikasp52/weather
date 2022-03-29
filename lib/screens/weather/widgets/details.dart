import 'package:flutter/material.dart';
import 'package:weather/util/colors.dart';

class Details extends StatelessWidget {
  const Details({
    Key? key,
    required this.title,
    required this.value,
    this.titleFontSize,
    this.valueFontSize,
  }) : super(key: key);

  final String title;
  final String value;
  final double? titleFontSize;
  final double? valueFontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: CustomColor.backgroundColor,
            fontWeight: FontWeight.bold,
            fontSize: valueFontSize ?? 16,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          title,
          style: TextStyle(
            color: CustomColor.greyColor,
            fontSize: titleFontSize ?? 12,
          ),
        ),
      ],
    );
  }
}

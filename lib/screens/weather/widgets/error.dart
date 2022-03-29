import 'package:flutter/material.dart';
import 'package:weather/util/colors.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    Key? key,
    required this.errorMessage,
    required this.onPressed,
  }) : super(key: key);

  final String errorMessage;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.error,
          color: Colors.white,
          size: 60,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          errorMessage,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: CustomColor.whiteColor,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        MaterialButton(
          onPressed: onPressed,
          color: CustomColor.cardColor,
          child: const Text(
            'Retry',
            style: TextStyle(
              color: CustomColor.whiteColor,
              //fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}

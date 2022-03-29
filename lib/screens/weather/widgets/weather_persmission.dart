import 'package:flutter/material.dart';
import 'package:weather/util/colors.dart';

class WeatherPermissionMessage extends StatelessWidget {
  const WeatherPermissionMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Icon(
            Icons.location_disabled,
            color: CustomColor.whiteColor,
            size: 70,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

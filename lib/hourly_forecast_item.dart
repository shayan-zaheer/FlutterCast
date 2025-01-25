import "package:flutter/material.dart";

class HourlyForecastItem extends StatelessWidget {
  final String time;
  final Icon icon;
  final String temperature;

  const HourlyForecastItem(
      {super.key,
      required this.time,
      required this.icon,
      required this.temperature});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 90,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              time,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            icon,
            Text(temperature)
          ],
        ),
      ),
    );
  }
}

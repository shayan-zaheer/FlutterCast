import "package:flutter/material.dart";

class HourlyForecastItem extends StatelessWidget {
  const HourlyForecastItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 90,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("09:00",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
            Icon(Icons.cloud, size: 32),
            Text("320.12")
          ],
        ),
      ),
    );
  }
}

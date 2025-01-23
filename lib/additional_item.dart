import "package:flutter/material.dart";

class AdditionalItem extends StatelessWidget {
  final Icon myIcon;
  final String type;
  final String val;

  const AdditionalItem(
      {super.key, required this.myIcon, required this.type, required this.val});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          myIcon,
          Text(type),
          Text(val,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
    );
  }
}
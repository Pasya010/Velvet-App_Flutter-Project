import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const CategoriesWidget({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon),
        SizedBox(height: 5),
        Text(
          text,
          style: TextStyle(fontSize: 13),
        ),
      ],
    );
  }
}

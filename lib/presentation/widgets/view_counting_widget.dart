import 'package:flutter/material.dart';

class ViewCountingWidget extends StatelessWidget {
  const ViewCountingWidget({
    Key? key,
    required this.icon,
    required this.color,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: color,
        ),
        Text(text)
      ],
    );
  }
}

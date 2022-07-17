import 'package:flutter/material.dart';

import 'circle_button.dart';

class QuickButton extends StatelessWidget {
  const QuickButton({
    Key? key, required this.iconData, required this.text, required this.color,
  }) : super(key: key);

  final IconData iconData;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleButton(
            color: color,
            iconData: iconData,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            text,
            style: TextStyle(
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

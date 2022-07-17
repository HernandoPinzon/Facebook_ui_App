import 'dart:developer';

import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton(
      {Key? key,
      required this.color,
      required this.iconData,
      this.showBadge = false})
      : super(key: key);
  final Color color;
  final IconData iconData;
  final bool showBadge;

  @override
  Widget build(BuildContext context) {
    log('dsdsfdfsd dfsdf');
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: Icon(
            iconData,
            color: Colors.white,
            size: 16,
          ),
        ),
        if (showBadge)
          Positioned(
            top: 6,
            right: 2,
            child: Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
                border: Border.all(width: 3, color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }
}

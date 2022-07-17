import 'package:facebook/facebook_ui/widgets/avatar.dart';
import 'package:flutter/material.dart';

class WhatOnYourMind extends StatelessWidget {
  const WhatOnYourMind({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children:  const [
        Avatar(
          size: 50,
          asset: 'assets/users/1.jpg',
        ),
        SizedBox(
          width: 20,
        ),
        Flexible(
          child: Text(
            "What's in your mind",
            style: TextStyle(color: Colors.grey),
          ),
        )
      ],
    );
  }
}

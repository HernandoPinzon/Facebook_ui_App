import 'package:flutter/material.dart';

import '../../models/story.dart';
import 'avatar.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({
    Key? key,
    required this.story, required this.index,
  }) : super(key: key);

  final Story story;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 130,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: index==0?20:7,
                  right: 7,
                ),
                width: 80,
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    image: AssetImage(story.bg),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Avatar(
                  size: 40,
                  asset: story.avatar,
                  borderWidth: 3,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 70,
          child: Text(
            story.username,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

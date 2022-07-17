import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook/facebook_ui/widgets/avatar.dart';
import 'package:facebook/icons/custom_icons.dart';
import 'package:facebook/models/publication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeago/timeago.dart' as timeago;

class PublicationItem extends StatelessWidget {
  const PublicationItem({Key? key, required this.publication})
      : super(key: key);
  final Publication publication;

  String _getEmojiPath(Reaction reaction) {
    switch (reaction) {
      case Reaction.like:
        return 'assets/emojis/like.svg';
      case Reaction.love:
        return 'assets/emojis/heart.svg';
      case Reaction.laugh:
        return 'assets/emojis/laughing.svg';
      case Reaction.sad:
        return 'assets/emojis/sad.svg';
      case Reaction.shocked:
        return 'assets/emojis/shocked.svg';
      case Reaction.angry:
        return 'assets/emojis/angry.svg';
    }
  }

  String _formatCount(int value) {
    if (value <= 1000) {
      return value.toString();
    } else if (value < 1000000) {
      return '${(value / 1000).toStringAsFixed(1)}k';
    } else {
      return '${(value / 1000000).toStringAsFixed(1)}m';
    }
  }

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.symmetric(
      horizontal: 20.0,
      vertical: 10,
    );

    const reactions = Reaction.values;
    return Container(
      decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(
        color: Color.fromARGB(255, 214, 214, 214),
        width: 6,
      ))),
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: padding,
            child: Row(
              children: [
                Avatar(
                  size: 40,
                  asset: publication.user.avatar,
                ),
                SizedBox(width: 10),
                Text(publication.user.username),
                Spacer(),
                Text(timeago.format(publication.createdAt))
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: CachedNetworkImage(
              imageUrl: publication.imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: padding.copyWith(top: 15),
            child: Text(
              publication.title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ...List.generate(
                      reactions.length,
                      (index) {
                        final reaction = reactions[index];
                        final bool isActive =
                            reaction == publication.currentUserReaction;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                _getEmojiPath(reaction),
                                width: 22,
                                height: 22,
                              ),
                              SizedBox(height: 3),
                              Icon(
                                Icons.circle,
                                color: isActive
                                    ? Colors.redAccent
                                    : Colors.transparent,
                                size: 5,
                              )
                            ],
                          ),
                        );
                        //return Icon(CustomIcons.laughing, size: 30,);
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: FittedBox(
                      child: Row(
                        children: [
                          Text(
                            '${_formatCount(publication.commentsCount)} Comments',
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            '${_formatCount(publication.sharesCount)} Shares',
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

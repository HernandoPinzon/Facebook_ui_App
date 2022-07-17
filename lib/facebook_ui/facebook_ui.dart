import 'package:facebook/facebook_ui/widgets/circle_button.dart';
import 'package:facebook/facebook_ui/widgets/publication_item.dart';
import 'package:facebook/facebook_ui/widgets/quick_actions.dart';
import 'package:facebook/facebook_ui/widgets/stories.dart';
import 'package:facebook/facebook_ui/widgets/what_on_your_mind.dart';
import 'package:facebook/icons/custom_icons.dart';
import 'package:facebook/models/publication.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:faker/faker.dart';

class FacebookUi extends StatelessWidget {
  const FacebookUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    final publications = <Publication>[];
    for (var i = 0; i < 10; i++) {
      final random = faker.randomGenerator;
      const reactions = Reaction.values;
      final reactionIndex = random.integer(reactions.length - 1);
      final publication = Publication(
        user: User(
          avatar: faker.image.image(),
          username: faker.person.name(),
        ),
        title: faker.lorem.sentence(),
        createdAt: faker.date.dateTime(),
        imageUrl: faker.image.image(),
        commentsCount: random.integer(2000),
        sharesCount: random.integer(100),
        currentUserReaction: reactions[reactionIndex],
      );
      publications.add(publication);
    }
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        actions: const [
          CircleButton(color: Colors.grey, iconData: CustomIcons.search),
          SizedBox(width: 14),
          CircleButton(color: Colors.red, iconData: CustomIcons.bell),
          SizedBox(width: 14),
          CircleButton(
              color: Color.fromARGB(255, 111, 188, 252),
              iconData: CustomIcons.userFriends,
              showBadge: true),
          SizedBox(width: 14),
          CircleButton(color: Colors.blue, iconData: CustomIcons.messenger),
          SizedBox(width: 14),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 150,
        leading: SvgPicture.asset(
          'assets/logos/facebook.svg',
          color: Colors.blueAccent,
          width: 150,
        ),
      ),
      body: Scrollbar(
        child: ListView(
          padding: const EdgeInsets.only(top: 15),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  WhatOnYourMind(),
                  SizedBox(height: 20),
                  QuickActions(),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Stories(),
            ListView.builder(
              //para solucionar el bug
              shrinkWrap: true,
              //para que sea scroleado por el padre
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                return PublicationItem(publication: publications[index]);
              },
              itemCount: publications.length,
            ),
          ],
        ),
      ),
    );
  }
}

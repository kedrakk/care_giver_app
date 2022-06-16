import 'package:care_giver/const/theme.dart';
import 'package:care_giver/data/news_feed.dart';
import 'package:care_giver/widget/newsfeed_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Newsfeed'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: Center(
        child: NewsfeedCardWidget(
          newsFeed: NewsFeed(
            name: "name",
            instruction: "instruction",
            caution: "caution",
            photo:
                "https://w7.pngwing.com/pngs/812/897/png-transparent-kit-first-aid-kit-emergency-physician-medicine-cruz-help-rescue-bless-you-caution-doctor-thumbnail.png",
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: const IconThemeData(size: 22),
        visible: true,
        onOpen: () => debugPrint('OPENING DIAL'),
        onClose: () => debugPrint('DIAL CLOSED'),
        tooltip: 'Speed Dial',
        heroTag: 'speed-dial-hero-tag',
        backgroundColor: AppTheme.quaternary,
        foregroundColor: AppTheme.octonary,
        elevation: 8.0,
        shape: const CircleBorder(),
        children: [
          SpeedDialChild(
            child: const Icon(
              Icons.accessibility,
              color: AppTheme.octonary,
            ),
            backgroundColor: AppTheme.quaternary,
            label: 'Accessibility',
            labelStyle: const TextStyle(fontSize: 18.0),
            onTap: () {
              debugPrint('FIRST CHILD');
            },
          ),
        ],
      ),
    );
  }
}

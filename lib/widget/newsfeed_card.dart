import 'package:cached_network_image/cached_network_image.dart';
import 'package:care_giver/const/theme.dart';
import 'package:care_giver/data/news_feed.dart';
import 'package:flutter/material.dart';

class NewsfeedCardWidget extends StatelessWidget {
  const NewsfeedCardWidget({
    Key? key,
    required this.newsFeed,
  }) : super(key: key);
  final NewsFeed newsFeed;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                newsFeed.name,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const Divider(
              color: AppTheme.nonary,
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 4),
              leading: CachedNetworkImage(
                imageUrl: newsFeed.photo,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                width: 100,
                fit: BoxFit.contain,
              ),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 7.0),
                child: Text(newsFeed.instruction),
              ),
              subtitle: Text(
                "* ${newsFeed.caution}",
                style: const TextStyle(
                  color: AppTheme.septenary,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

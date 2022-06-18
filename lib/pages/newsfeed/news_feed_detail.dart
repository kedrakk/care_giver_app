import 'package:cached_network_image/cached_network_image.dart';
import 'package:care_giver/data/news_feed.dart';
import 'package:flutter/material.dart';

import '../../const/theme.dart';

class NewsFeedDetailPage extends StatelessWidget {
  const NewsFeedDetailPage({
    Key? key,
    required this.newsFeed,
  }) : super(key: key);
  final NewsFeed newsFeed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          newsFeed.name,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 1 / 5,
                child: CachedNetworkImage(
                  imageUrl: newsFeed.photo,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  width: 100,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 10),
              Text(newsFeed.instruction),
              const SizedBox(height: 10),
              Text(
                "* ${newsFeed.caution}",
                style: const TextStyle(
                  color: AppTheme.septenary,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

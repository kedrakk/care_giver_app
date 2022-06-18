import 'dart:async';

import 'package:care_giver/const/theme.dart';
import 'package:care_giver/controller/newsfeed_controller.dart';
import 'package:care_giver/pages/newsfeed/news_feed_detail.dart';
import 'package:care_giver/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchNewsFeedPage extends StatefulWidget {
  const SearchNewsFeedPage({Key? key}) : super(key: key);

  @override
  State<SearchNewsFeedPage> createState() => _SearchNewsFeedPageState();
}

class _SearchNewsFeedPageState extends State<SearchNewsFeedPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();

  Timer? _debounce;

  @override
  void initState() {
    _searchController.addListener(() {
      if (_debounce?.isActive ?? false) _debounce?.cancel();
      _debounce = Timer(const Duration(milliseconds: 500), () {
        Get.find<NewsfeedController>().searchNewsFeed(_searchController.text);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          height: 40,
          color: Colors.white,
          child: Center(
            child: TextFormFieldWidget(
              controller: _searchController,
              focusNode: _searchFocus,
              labelText: "Enter first aid name to search",
              onFieldSubmitted: (value) {},
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _searchController.clear();
                },
              ),
              validator: (value) {
                return null;
              },
            ),
          ),
        ),
      ),
      body: GetBuilder<NewsfeedController>(
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.newsfeed.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () => Get.to(
                  () => NewsFeedDetailPage(
                    newsFeed: controller.newsfeed[index],
                  ),
                ),
                leading: const Icon(
                  Icons.local_hospital,
                  color: AppTheme.denary,
                ),
                title: Text(controller.newsfeed[index].name),
                subtitle: Text(controller.newsfeed[index].instruction),
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}

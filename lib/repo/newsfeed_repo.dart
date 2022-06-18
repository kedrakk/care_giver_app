import 'package:care_giver/data/news_feed.dart';
import 'package:care_giver/network/rest_client.dart';
import 'package:dio/dio.dart';

import '../helper/exception_helper.dart';

abstract class INewsfeedRepo {
  Future<List<NewsFeed>> getAllNewsfeed();
  Future<bool> addNewsfeed(NewsFeed newsFeed);
  Future<List<NewsFeed>> searchNewsFeed(String username);
}

class NewsFeedRepo implements INewsfeedRepo {
  final RestClient _client;
  NewsFeedRepo(this._client);

  @override
  Future<List<NewsFeed>> getAllNewsfeed() async {
    try {
      final response = await _client.getnewsfeed();
      return response.data.map<NewsFeed>((e) => NewsFeed.fromJson(e)).toList();
    } catch (e) {
      return catchException(e as DioError);
    }
  }

  @override
  Future<bool> addNewsfeed(NewsFeed newsFeed) async {
    try {
      await _client.postnewsfeed(
        newsFeed.name,
        newsFeed.instruction,
        newsFeed.caution,
        newsFeed.photo,
      );
      return true;
    } catch (e) {
      return catchException(e as DioError);
    }
  }

  @override
  Future<List<NewsFeed>> searchNewsFeed(String username) async {
    try {
      final response = await _client.searchNewsfeed(username);
      return response.data.map<NewsFeed>((e) => NewsFeed.fromJson(e)).toList();
    } catch (e) {
      return catchException(e as DioError);
    }
  }
}

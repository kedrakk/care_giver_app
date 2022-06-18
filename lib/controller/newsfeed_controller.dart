import 'package:care_giver/data/news_feed.dart';
import 'package:get/get.dart';

import '../repo/newsfeed_repo.dart';

class NewsfeedController extends GetxController {
  final INewsfeedRepo _repo;
  NewsfeedController(this._repo);

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  String _error = '';
  String get error => _error;

  List<NewsFeed> _newsfeed = [];
  List<NewsFeed> get newsfeed => _newsfeed;

  getAllNewsFeed() async {
    _isLoading = true;
    try {
      _newsfeed = await _repo.getAllNewsfeed();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      update();
    }
  }

  @override
  void onInit() {
    getAllNewsFeed();
    super.onInit();
  }

  Future<bool> addNewsFeed(NewsFeed newsFeed) async {
    try {
      final response = await _repo.addNewsfeed(newsFeed);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

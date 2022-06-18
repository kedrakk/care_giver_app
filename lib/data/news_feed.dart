import 'package:json_annotation/json_annotation.dart';

part 'news_feed.g.dart';

@JsonSerializable()
class NewsFeed {
  final int id;
  final String name, instruction, caution;
  final String photo;
  NewsFeed({
    required this.id,
    required this.name,
    required this.instruction,
    required this.caution,
    required this.photo,
  });
  factory NewsFeed.fromJson(Map<String, dynamic> json) =>
      _$NewsFeedFromJson(json);
  Map<String, dynamic> toJson() => _$NewsFeedToJson(this);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsFeed _$NewsFeedFromJson(Map<String, dynamic> json) => NewsFeed(
      id: json['id'] as int,
      name: json['name'] as String,
      instruction: json['instruction'] as String,
      caution: json['caution'] as String,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$NewsFeedToJson(NewsFeed instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'instruction': instance.instruction,
      'caution': instance.caution,
      'photo': instance.photo,
    };

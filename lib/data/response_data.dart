import 'package:json_annotation/json_annotation.dart';

part 'response_data.g.dart';

@JsonSerializable()
class ResponseData {
  final String message;
  final bool success;
  final dynamic data;
  ResponseData({
    required this.message,
    required this.success,
    required this.data,
  });
  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}

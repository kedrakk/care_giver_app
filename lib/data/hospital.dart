import 'package:json_annotation/json_annotation.dart';

part 'hospital.g.dart';

@JsonSerializable()
class Hospital {
  final int id;
  @JsonKey(name: 'hospital_name')
  final String hospitalName;
  final String phone, address;
  final double latitude, longitude;
  Hospital({
    required this.id,
    required this.hospitalName,
    required this.phone,
    required this.address,
    required this.latitude,
    required this.longitude,
  });
  factory Hospital.fromJson(Map<String, dynamic> json) =>
      _$HospitalFromJson(json);
  Map<String, dynamic> toJson() => _$HospitalToJson(this);
}

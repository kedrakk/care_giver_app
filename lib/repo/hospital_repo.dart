import 'package:care_giver/data/hospital.dart';
import 'package:care_giver/network/rest_client.dart';
import 'package:dio/dio.dart';

import '../helper/exception_helper.dart';

abstract class IHospitalRepo {
  Future<List<Hospital>> getHospitals(double lat, double lng);
}

class HospitalRepo implements IHospitalRepo {
  final RestClient _client;
  HospitalRepo(this._client);

  @override
  Future<List<Hospital>> getHospitals(double lat, double lng) async {
    try {
      final response = await _client.getNearestHospitals(lat, lng);
      return response.data.map<Hospital>((e) => Hospital.fromJson(e)).toList();
    } catch (e) {
      return catchException(e as DioError);
    }
  }
}

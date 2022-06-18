import 'package:care_giver/const/api_const.dart';
import 'package:care_giver/data/response_data.dart';
import 'package:care_giver/data/user.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: backendURL)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST(APIs.login)
  Future<ResponseData> login(
    @Field('username') String username,
    @Field('password') String password,
  );

  @POST(APIs.register)
  Future<User> register();

  @POST(APIs.logout)
  Future<void> logout();
}

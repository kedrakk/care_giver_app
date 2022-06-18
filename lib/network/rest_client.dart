import 'package:care_giver/const/api_const.dart';
import 'package:care_giver/data/response_data.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: backendURL)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @Headers({'Content-Type': 'application/json', 'Accept': 'application/json'})
  @POST(APIs.login)
  Future<ResponseData> login(
    @Field('username') String username,
    @Field('password') String password,
  );

  @Headers({'Content-Type': 'application/json', 'Accept': 'application/json'})
  @POST(APIs.register)
  Future<ResponseData> register(
    @Field('username') String username,
    @Field('password') String password,
    @Field('contact') String contact,
  );

  @Headers({'Content-Type': 'application/json', 'Accept': 'application/json'})
  @POST(APIs.logout)
  Future<ResponseData> logout(@Header('Authorization') String autho);
}

import 'package:infinialabs_ai/helper/response_converter.dart';
import 'package:infinialabs_ai/model/auth_data.dart';
import 'package:infinialabs_ai/network/api_client.dart';
import 'package:infinialabs_ai/network/http_method.dart';
import 'package:infinialabs_ai/utils/logger.dart';

class AuthNWRepository {
  final String _signUpUrl = '/auth/signup';
  final String _loginUrl = '/auth/login';

  Future<AuthData> requestSignUp({
    required Map<String, dynamic> signUpMap,
  }) async {
    final signUpMap = {
      "name": "om",
      "email": "om@gmail.com",
      "password": "ismail123",
      "height": "5'8''",
      "age": "27",
    };

    final data = await ApiClient.request(
      endpoint: _signUpUrl,
      data: signUpMap,
      method: HttpMethod.post,
    );

    return ResponseConverter.from(data: data, fun: AuthData.fromJson);
  }

  Future<AuthData> requestLogIn({
    required Map<String, dynamic> logInMap,
  }) async {
    final data = await ApiClient.request(
      endpoint: _loginUrl,
      method: HttpMethod.post,
      data: logInMap,
    );

    Logger.logInDebug('login response $data');

    return ResponseConverter.from(data: data, fun: AuthData.fromJson);
  }
}

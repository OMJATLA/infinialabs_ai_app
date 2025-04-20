import 'package:infinialabs_ai/model/auth_data.dart';

abstract class AuthRepository {
  Future<AuthData> requestSignUp({required Map<String, dynamic> signUpMap});

  Future<AuthData> requestLogIn({required Map<String, dynamic> logInMap});

  Future<String?> getAuthToken();
}

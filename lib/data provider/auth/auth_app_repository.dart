import 'package:infinialabs_ai/model/auth_data.dart';
import 'package:infinialabs_ai/data%20provider/auth/auth_local_repository.dart';
import 'package:infinialabs_ai/data%20provider/auth/auth_nw_repository.dart';
import 'package:infinialabs_ai/data%20provider/auth/auth_repository.dart';

class AuthAppRepository extends AuthRepository {
  final _userAuthNWRepo = AuthNWRepository();
  final _userAuthLocalRepo = AuthLocalRepository();

  @override
  Future<AuthData> requestSignUp({
    required Map<String, dynamic> signUpMap,
  }) async {
    final authData = await _userAuthNWRepo.requestSignUp(signUpMap: signUpMap);
    if (authData.accessToken != null) {
      await _userAuthLocalRepo.saveAuthToken(authData.accessToken!);
    }
    return authData;
  }

  @override
  Future<AuthData> requestLogIn({
    required Map<String, dynamic> logInMap,
  }) async {
    final authData = await _userAuthNWRepo.requestLogIn(logInMap: logInMap);
    if (authData.accessToken != null) {
      await _userAuthLocalRepo.saveAuthToken(authData.accessToken!);
    }
    return authData;
  }

  @override
  Future<String?> getAuthToken() {
    return _userAuthLocalRepo.getAuthToken();
  }

  @override
  Future<void> removeAuthInfo() {
    return _userAuthLocalRepo.removeAuthInfo();
  }
}

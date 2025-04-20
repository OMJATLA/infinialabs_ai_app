import 'package:infinialabs_ai/utils/app_constants.dart';
import 'package:infinialabs_ai/utils/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalRepository {
  Future<void> saveAuthToken(String value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(AppConstants.accessTokenKey, value);
    } catch (e) {
      Logger.logInDebug(e);
    }
  }

  Future<String?> getAuthToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(AppConstants.accessTokenKey);
    } catch (e) {
      Logger.logInDebug(e);
      return null;
    }
  }

  Future<void> removeAuthInfo() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(AppConstants.accessTokenKey);
    } catch (e) {
      Logger.logInDebug(e);
    }
  }
}

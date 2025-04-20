import 'package:infinialabs_ai/network/api_client.dart';
import 'package:infinialabs_ai/network/http_method.dart';
import 'package:infinialabs_ai/utils/logger.dart';

class UserNWRepository {
  final String _getUserUrl = '/user/getuserprofile';

  Future<void> getUserProfile() async {
    final data = await ApiClient.request(
      endpoint: _getUserUrl,
      method: HttpMethod.get,
    );

    Logger.logInDebug('User data $data');
  }
}

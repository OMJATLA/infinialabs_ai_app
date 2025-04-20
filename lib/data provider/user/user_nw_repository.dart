import 'package:infinialabs_ai/helper/response_converter.dart';
import 'package:infinialabs_ai/model/user.dart';
import 'package:infinialabs_ai/network/api_client.dart';
import 'package:infinialabs_ai/network/http_method.dart';

class UserNWRepository {
  final String _getUserUrl = '/user/getuserprofile';

  Future<User> getUserProfile() async {
    final data = await ApiClient.request(
      endpoint: _getUserUrl,
      method: HttpMethod.get,
    );
    return ResponseConverter.from(data: data, fun: User.fromJson);
  }
}

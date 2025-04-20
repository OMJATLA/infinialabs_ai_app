import 'package:infinialabs_ai/data%20provider/user/user_nw_repository.dart';

import 'package:infinialabs_ai/data%20provider/user/user_repository.dart';
import 'package:infinialabs_ai/model/user.dart';

class UserAppRepository extends UserRepository {
  final _userNWRepo = UserNWRepository();

  @override
  Future<User> getUserProfile() {
    return _userNWRepo.getUserProfile();
  }
}

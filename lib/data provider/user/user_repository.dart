import 'package:infinialabs_ai/model/user.dart';

abstract class UserRepository {
  Future<User> getUserProfile();
}

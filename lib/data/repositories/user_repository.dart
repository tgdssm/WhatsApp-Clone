import 'package:whatsapp/data/models/user_model.dart';
import 'package:whatsapp/data/providers/user_provider.dart';

class UserRepository {
  final _userProvider = UserProvider();

  Future<void> createUser(UserModel userModel) async {
    await _userProvider.create(userModel);
  }

  Future<UserModel?> readUser(String uid) async {
    return await _userProvider.read(uid);
  }
}
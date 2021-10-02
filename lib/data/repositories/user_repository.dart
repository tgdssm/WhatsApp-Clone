import 'package:whatsapp/data/models/user.dart';
import 'package:whatsapp/data/providers/user_provider.dart';

class UserRepository {
  final _userProvider = UserProvider();

  Future<void> createUser(User userModel) async {
    await _userProvider.create(userModel);
  }

  Future<User?> readUser(String uid) async {
    return await _userProvider.read(uid);
  }
}
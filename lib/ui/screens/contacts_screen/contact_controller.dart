import 'package:whatsapp/data/models/user.dart';
import 'package:whatsapp/data/repositories/user_repository.dart';

class ContactsController {
  UserRepository _userRepository = UserRepository();
  List<User> listOfUsersNotAdded = [];

  Future<void> getUserList() async{
    List<User>? list = await _userRepository.readListOfUsersNotAdded();
    list != null?listOfUsersNotAdded.addAll(list):listOfUsersNotAdded = [];
  }

}
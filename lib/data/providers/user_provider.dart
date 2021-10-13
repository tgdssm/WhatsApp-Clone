import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp/data/models/user.dart';
import 'package:whatsapp/utils/globals.dart';

class UserProvider {
  CollectionReference _collectionReference = FirebaseFirestore.instance.collection('Users');

  Future<void> create(User userModel) async{
    try{
      await _collectionReference.add(userModel.toJson());
    } on FirebaseException catch(_) {
      print('Erro ao criar usuario');
    }
  }

  Future<User?>readCurrentUser(String uid) async{
    User user;
    try {
      QuerySnapshot snapshot = await _collectionReference.where('uid', isEqualTo: uid).get();
      user = User.fromJson(snapshot.docs.first.data() as Map<String, dynamic>);
      return user;
    } on FirebaseException catch(_){
      print('Erro ao ler usuario');
    }
  }

  Future<List<User>?> readListOfUsersNotAdded() async{
    List<User> users = [];
    QuerySnapshot snapshot = await _collectionReference.where('uid', isNotEqualTo: globalCurrentUser!.uid).get();
    await Future.forEach(snapshot.docs, (QueryDocumentSnapshot element) {
      users.add(User.fromJson(element.data() as Map<String, dynamic>));
    });
    print(users);
    return users;
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp/data/models/user_model.dart';

class UserProvider {
  CollectionReference _collectionReference = FirebaseFirestore.instance.collection('Users');

  Future<void> create(UserModel userModel) async{
    try{
      await _collectionReference.add(userModel.toJson());
    } on FirebaseException catch(_) {
      print('Erro ao criar usuario');
    }
  }

  Future<UserModel?>read(String uid) async{
    UserModel user;
    try {
      QuerySnapshot snapshot = await _collectionReference.where('uid', isEqualTo: uid).get();
      user = UserModel.fromJson(snapshot.docs.first.data() as Map<String, dynamic>);
      return user;
    } on FirebaseException catch(_){
      print('Erro ao ler usuario');
    }
  }
}

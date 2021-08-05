import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User> createUserWithEmailAndPassword(String email, String password) async {
    try{
      final credential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch(e){
      print('Erro ao registrar usuario');
    }
  }

  Future<User> signInWithEmailAndPassword(String email, String password)async {
    try{
      final credential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch(e){
      print('Erro ao fazer login');
    }
  }

  Future<void> signout() async {
  }
}
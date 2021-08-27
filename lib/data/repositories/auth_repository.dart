import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsapp/data/providers/auth_provider.dart';

class AuthRepository {
  final AuthProvider _authProvider = AuthProvider();

  Future<User?> createUserWithEmailAndPassword(String email, String password) async {
    return await _authProvider.createUserWithEmailAndPassword(email, password);
  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    return await _authProvider.signInWithEmailAndPassword(email, password);
  }

}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:whatsapp/data/repositories/auth_repository.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final authRepository = AuthRepository();
  test('Deve fazer login', () async{
    final user = await authRepository.createUserWithEmailAndPassword('thalissongabriel1999@mail.com', '1234567');
    expect(user, User);
  });
}
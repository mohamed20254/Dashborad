import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthServieces {
  Future<String> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> logout();
}

class AuthServicesImpl implements AuthServieces {
  final FirebaseAuth _firebaseAuth;

  AuthServicesImpl({required FirebaseAuth firebaseAuth})
    : _firebaseAuth = firebaseAuth;

  @override
  Future<String> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((userCredential) => userCredential.user!.uid);
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}

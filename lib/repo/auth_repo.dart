import 'package:admain_panel/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../services/auth_services.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> logout();
}

class AuthRepoImpl implements AuthRepo {
  final AuthServieces authServieces;

  AuthRepoImpl({required this.authServieces});
  String adminuid = "NtyqxptSswdqxkwRYURYGMS2LU43";
  @override
  Future<Either<Failure, void>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final uid = await authServieces.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (uid.trim() != adminuid.trim()) {
        await authServieces.logout();
        return Left(
          Failure("You are not authorized to access the admin panel."),
        );
      }
      return Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<void> logout() async {
    await authServieces.logout();
  }
}

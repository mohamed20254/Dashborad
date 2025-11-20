import 'package:admain_panel/repo/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  AuthCubit(this.authRepo) : super(AuthInitial());
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    final result = await authRepo.loginWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (_) => emit(Authenticated()),
    );
  }
}

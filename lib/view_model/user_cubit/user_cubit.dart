import 'package:admain_panel/model/user_model.dart';
import 'package:admain_panel/repo/product_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final ProductRepo repo;
  UserCubit(this.repo) : super(UserInitial());
  Future<void> getUsers() async {
    emit(UserLodaing());
    final res = await repo.getUsers();
    res.fold(
      (faolure) => emit(UserFailure(message: faolure.message)),
      (users) => emit(UsersFinished(users)),
    );
  }
}

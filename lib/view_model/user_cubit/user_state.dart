part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserLodaing extends UserState {}

final class UsersFinished extends UserState {
  final List<UserModel> users;
  const UsersFinished(this.users);
  @override
  List<Object> get props => [users];
}

final class UserFailure extends UserState {
  final String message;

  const UserFailure({required this.message});

  @override
  List<Object> get props => [message];
}

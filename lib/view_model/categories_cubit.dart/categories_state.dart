part of 'categories_cubit.dart';

sealed class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoding extends CategoriesState {}

final class CategoriesFinished extends CategoriesState {
  final List<CatogryModel> categories;

  const CategoriesFinished({required this.categories});
  @override
  List<Object> get props => [categories];
}

final class CategoriesFailure extends CategoriesState {
  final String message;

  const CategoriesFailure({required this.message});
  @override
  List<Object> get props => [message];
}

import 'package:admain_panel/model/category_model.dart';
import 'package:admain_panel/repo/product_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
<<<<<<< HEAD
  final ProductRepo repo;
  CategoriesCubit(this.repo) : super(CategoriesInitial());
  Future<void> getCategory() async {
    emit(CategoriesLoding());
    final res = await repo.getCategories();
    res.fold((failure) => emit(CategoriesFailure(message: failure.message)), (
      r,
    ) {
      if (!isClosed) {
        emit(CategoriesFinished(categories: r));
      }
    });
=======
  CategoriesCubit(this.repo) : super(CategoriesInitial());
  final ProductRepo repo;
  Future<void> getCategory() async {
    emit(CategoriesLoding());
    final res = await repo.getCategories();
    res.fold(
      (final failure) => emit(CategoriesFailure(message: failure.message)),
      (final r) {
        if (!isClosed) {
          emit(CategoriesFinished(categories: r));
        }
      },
    );
>>>>>>> cb17693e2ad89888018dba7b4a5e496b84bda125
  }
}

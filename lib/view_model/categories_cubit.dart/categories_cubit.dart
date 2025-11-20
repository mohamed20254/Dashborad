import 'package:admain_panel/model/category_model.dart';
import 'package:admain_panel/repo/product_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
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
  }
}

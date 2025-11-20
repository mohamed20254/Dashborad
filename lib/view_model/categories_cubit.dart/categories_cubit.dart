import 'package:admain_panel/model/category_model.dart';
import 'package:admain_panel/repo/product_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
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
  }
}

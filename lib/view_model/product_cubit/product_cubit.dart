import 'package:admain_panel/model/product_model.dart';
import 'package:admain_panel/repo/product_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo repo;

  ProductCubit(this.repo) : super(ProductInitial()) {
    getAllProudct();
  }
  Future<void> getAllProudct() async {
    emit(ProductLoding());
    final res = await repo.getAllProduct();
    res.fold(
      (failure) => emit(ProductFailure(message: failure.message)),
      (product) => emit(ProducFinished(products: product)),
    );
  }
}

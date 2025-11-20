part of 'product_cubit.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class ProductLoding extends ProductState {}

final class ProducFinished extends ProductState {
  final List<ProductModel> products;

  const ProducFinished({required this.products});
  @override
  List<Object> get props => [products];
}

final class ProductFailure extends ProductState {
  final String message;

  const ProductFailure({required this.message});
  @override
  List<Object> get props => [message];
}

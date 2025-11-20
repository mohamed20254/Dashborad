import 'package:admain_panel/core/error/failure.dart';
import 'package:admain_panel/core/error/sever_exption.dart';
import 'package:admain_panel/model/product_model.dart';
import 'package:admain_panel/services/product_services.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductModel>>> getAllProduct();
}

class ProductRepoImpl extends ProductRepo {
  final ProductServices productservises;

  ProductRepoImpl({required this.productservises});

  @override
  Future<Either<Failure, List<ProductModel>>> getAllProduct() async {
    try {
      final data = await productservises.getAllproduct();
      return right(data);
    } on FirebaseException catch (e) {
      return left(Failure(MyFirebaseServiceException(e.code).message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}

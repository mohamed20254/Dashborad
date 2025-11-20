import 'package:admain_panel/core/error/failure.dart';
import 'package:admain_panel/core/error/sever_exption.dart';
import 'package:admain_panel/model/product_model.dart';
import 'package:admain_panel/model/user_model.dart';
import 'package:admain_panel/services/data_base_services.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

// refacor name class dataBase
abstract class ProductRepo {
  Future<Either<Failure, List<ProductModel>>> getAllProduct();
  Future<Either<Failure, List<UserModel>>> getUsers();
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

  @override
  Future<Either<Failure, List<UserModel>>> getUsers() async {
    try {
      final users = await productservises.getUsers();
      return right(users);
    } on FirebaseException catch (e) {
      return left(Failure(MyFirebaseServiceException(e.code).message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}

import 'package:admain_panel/model/category_model.dart';
import 'package:admain_panel/model/product_model.dart';
import 'package:admain_panel/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ProductServices {
  Future<List<ProductModel>> getAllproduct();
  Future<void> removeElement(final String id);
  Future<List<UserModel>> getUsers();
  Future<List<CatogryModel>> getcategory();
}

class ProductServicesImpl extends ProductServices {
  ProductServicesImpl({required this.firebaseFirestore});
  final FirebaseFirestore firebaseFirestore;
  @override
  Future<List<ProductModel>> getAllproduct() async {
    final response = await firebaseFirestore.collection("products").get();
    final docs = response.docs;
    return docs.map((final e) => ProductModel.fromJson(e.data())).toList();
  }

  @override
  Future<void> removeElement(final String id) async {
    firebaseFirestore.collection("products").doc(id).delete();
  }

  @override
  Future<List<UserModel>> getUsers() async {
    final response = await firebaseFirestore.collection("user").get();
    final data = response.docs;
    return data.map((final e) => UserModel.fromMap(e.data())).toList();
  }

  @override
  Future<List<CatogryModel>> getcategory() async {
    final response = await firebaseFirestore.collection("category").get();
    final categories = response.docs;
    return categories
        .map((final e) => CatogryModel.formJason(e.data()))
        .toList();
  }
}

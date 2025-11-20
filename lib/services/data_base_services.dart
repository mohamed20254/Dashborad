import 'package:admain_panel/model/category_model.dart';
import 'package:admain_panel/model/product_model.dart';
import 'package:admain_panel/model/user_model.dart';
import 'package:admain_panel/presentation/categories/screen/categories_screen.dart';
import 'package:admain_panel/repo/product_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

abstract class ProductServices {
  Future<List<ProductModel>> getAllproduct();
  Future<void> removeElement(final String id);
  Future<List<UserModel>> getUsers();
  Future<List<CatogryModel>> getcategory();
}

class ProductServicesImpl extends ProductServices {
  final FirebaseFirestore firebaseFirestore;

  ProductServicesImpl({required this.firebaseFirestore});
  @override
  Future<List<ProductModel>> getAllproduct() async {
    final response = await firebaseFirestore.collection("products").get();
    final docs = response.docs;
    return docs.map((e) => ProductModel.fromJson(e.data())).toList();
  }

  @override
  Future<void> removeElement(final String id) async {
    firebaseFirestore.collection("products").doc(id).delete();
  }

  @override
  Future<List<UserModel>> getUsers() async {
    final response = await firebaseFirestore.collection("user").get();
    final data = response.docs;
    return data.map((e) => UserModel.fromMap(e.data())).toList();
  }

  @override
  Future<List<CatogryModel>> getcategory() async {
    final response = await firebaseFirestore.collection("category").get();
    final categories = response.docs;
    return categories.map((e) => CatogryModel.formJason(e.data())).toList();
  }
}

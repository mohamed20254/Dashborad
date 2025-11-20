import 'package:admain_panel/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ProductServices {
  Future<List<ProductModel>> getAllproduct();
  Future<void> removeElement(final String id);
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
}

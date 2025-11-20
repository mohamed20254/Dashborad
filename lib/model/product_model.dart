class ProductModel {
  final String creationAt;
  final String updatedAt;
  final int id;
  final String title;
  final String description;
  final double price;
  final String categoryid;
  final String brand;
  final List<String> color;
  final List<String> sizes;
  final int stock;
  final List<String> images;
  final double rating;
  final double discountPercentage;
  bool iselected;
  ProductModel({
    this.iselected = false,
    required this.discountPercentage,
    required this.creationAt,
    required this.updatedAt,
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.categoryid,
    required this.brand,
    required this.color,
    required this.sizes,
    required this.stock,
    required this.images,
    required this.rating,
  });
  factory ProductModel.fromJson(Map<String, dynamic> jsondata) {
    return ProductModel(
      creationAt: jsondata["creationAt"] ?? "",
      id: jsondata["id"] ?? 0,
      title: jsondata["title"] ?? "",
      description: jsondata["description"] ?? "",
      price: (jsondata["price"] as num?)?.toDouble() ?? 0.0,
      discountPercentage:
          (jsondata["discountPercentage"] as num?)?.toDouble() ?? 0.0,
      categoryid: jsondata["categoryid"] ?? "",
      brand: jsondata["brand"] ?? "",
      color: jsondata["color"] != null
          ? List<String>.from(jsondata["color"])
          : [],
      sizes: jsondata["sizes"] != null
          ? List<String>.from(jsondata["sizes"])
          : [],
      stock: jsondata["stock"] ?? 0,
      images: jsondata["images"] != null
          ? List<String>.from(jsondata["images"])
          : [],
      rating: (jsondata["rating"] as num?)?.toDouble() ?? 0.0,
      updatedAt: jsondata["updatedAt"] ?? "",
    );
  }
  Map<String, dynamic> tojson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "categoryid": categoryid,
      "price": price,
      "discountPercentage": discountPercentage,
      "rating": rating,
      "stock": stock,
      "brand": brand,
      "images": images,
      "creationAt": creationAt,
      "updatedAt": updatedAt,
      "size": sizes,
      "color": color,
    };
  }
}

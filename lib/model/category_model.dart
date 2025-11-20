class CatogryModel {
  CatogryModel({
    required this.name,
    required this.image,
    required this.parentid,
    this.isFeatured = true,
    this.isselcteed = false,
  });
  // ignore: prefer_final_parameters
  factory CatogryModel.formJason(Map<String, dynamic> json) {
    return CatogryModel(
      name: json["name"] ?? "",
      image: json["image"] ?? "",
      parentid: json["parentID"] ?? "",
      isFeatured: json['Isfeatured'] ?? false,
    );
  }
  final String name;
  final String image;
  final String parentid;
  bool isFeatured;
  bool isselcteed;

  Map<String, dynamic> tojson() {
    return {
      "name": name,
      "image": image,
      "parentID": parentid,
      "Isfeatured": isFeatured,
    };
  }
}

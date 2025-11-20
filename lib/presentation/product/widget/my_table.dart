import 'package:flutter/material.dart';

import '../../../core/helper/my_network_web_image.dart';
import '../../../model/product_model.dart';

class MyTable extends DataTableSource {
  final List<ProductModel> products;

  MyTable({required this.products});
  @override
  DataRow? getRow(int index) {
    if (index >= products.length) return null;
    final product = products[index];
    return DataRow(
      selected: product.iselected,
      onSelectChanged: (value) {
        product.iselected = value ?? false;
        notifyListeners(); // تحديث الجدول
      },
      cells: [
        DataCell(
          SizedBox(
            height: 30,
            child: MyNetworkImage(
              url: product.images.isNotEmpty ? product.images[0] : "",
            ),
          ),
        ),
        DataCell(Text(product.id.toString())),

        DataCell(Text(product.title)),
        DataCell(Text(product.rating.toString())),
        DataCell(Text(product.stock.toString())),
        DataCell(Text(product.brand.toString())),
        DataCell(Text(product.price.toString())),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => products.length;

  @override
  int get selectedRowCount =>
      products.where((element) => element.iselected).length;
}

class MyNetworkImage extends StatelessWidget {
  final String url;
  const MyNetworkImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return url.isNotEmpty
        ? WebImageWidget(imageUrl: url, height: 20, width: 30)
        : Icon(Icons.error);
  }
}

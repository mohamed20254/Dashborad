import 'dart:ui';
import 'package:admain_panel/presentation/product/widget/my_table.dart';
import 'package:admain_panel/view_model/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),

          Expanded(
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<ProductCubit, ProductState>(
                  builder: (final context, final state) {
                    if (state is ProductLoding) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ProductFailure) {
                      return Center(child: Text(state.message));
                    }
                    if (state is ProducFinished) {
                      return Column(
                        children: [
                          _buildAppbarwithPeouduct(context),
                          const SizedBox(height: 20),
                          Expanded(
                            child: SizedBox(
                              child: ScrollConfiguration(
                                behavior: ScrollConfiguration.of(context)
                                    .copyWith(
                                      dragDevices: {
                                        PointerDeviceKind.touch,
                                        PointerDeviceKind
                                            .mouse, // هذا يسمح بالسحب بالماوس
                                      },
                                    ),
                                child: SingleChildScrollView(
                                  child: PaginatedDataTable(
                                    actions: [
                                      IconButton(
                                        onPressed: () {
                                          state.products.removeWhere(
                                            (final element) =>
                                                element.iselected,
                                          );
                                          setState(() {});
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                    headingRowColor: MaterialStateProperty.all(
                                      Colors.grey[200],
                                    ), // لون صف الرأس

                                    header: Text(
                                      "Products",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyLarge,
                                    ),
                                    rowsPerPage: 7,
                                    columns: const [
                                      DataColumn(label: Text("image")),
                                      DataColumn(label: Text("ID")),
                                      DataColumn(label: Text("Name")),
                                      DataColumn(label: Text("rating")),
                                      DataColumn(label: Text("stock")),
                                      DataColumn(label: Text("brand")),
                                      DataColumn(label: Text("price")),
                                    ],
                                    source: MyTable(
                                      products: state.products,
                                    ), // داتا بتتبني في DataTableSource
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _buildAppbarwithPeouduct(final BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),

          onPressed: () {},
          child: Text(
            "Add product",
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.copyWith(color: Colors.white),
          ),
        ),

        SizedBox(
          width: 200,
          height: 50,
          child: Transform.scale(
            scale: 0.8,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search...",
                hintStyle: Theme.of(context).textTheme.labelLarge,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

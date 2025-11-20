import 'package:admain_panel/model/category_model.dart';
import 'package:admain_panel/presentation/product/widget/my_table.dart';
import 'package:admain_panel/view_model/categories_cubit.dart/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (final context, final state) {
              if (state is CategoriesLoding) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CategoriesFailure) {
                return Center(child: Text(state.message));
              }
              if (state is CategoriesFinished) {
                return Column(
                  children: [
                    const SizedBox(height: 20),
                    _buildHeader(context),
                    const SizedBox(height: 10),
                    Expanded(
                      child: SingleChildScrollView(
                        child: PaginatedDataTable(
                          header: Row(
                            children: [
                              CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.deepPurple.withValues(
                                  alpha: 0.4,
                                ),
                                child: const Icon(
                                  Icons.category,
                                  color: Colors.deepPurpleAccent,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "Categories",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                          rowsPerPage: 6,
                          columns: const [
                            DataColumn(label: Text("Name")),
                            DataColumn(label: Text("ISFeatured")),
                            DataColumn(label: Text("Creadit At")),
                          ],
                          source: DataTableSourcesCategory(
                            context,
                            categories: state.categories,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  Row _buildHeader(final BuildContext context) {
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
            "Add Category",
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: Colors.white),
          ),
        ),

        SizedBox(
          width: 200,
          height: 50,
          child: Transform.scale(
            scale: 0.9,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, size: 18),
                hintText: "Search...",
                hintStyle: Theme.of(context).textTheme.labelLarge,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DataTableSourcesCategory extends DataTableSource {
  DataTableSourcesCategory(this.context, {required this.categories});
  final BuildContext context;
  final List<CatogryModel> categories;

  @override
  DataRow? getRow(final int index) {
    if (index >= categories.length) return null;
    final category = categories[index];
    return DataRow(
      selected: category.isselcteed,
      onSelectChanged: (final value) {
        category.isselcteed = value ?? false;
        notifyListeners();
      },
      cells: [
        DataCell(
          SizedBox(
            height: 30,
            width: 30,
            child: MyNetworkImage(url: category.image),
          ),
        ),
        DataCell(Text(category.name)),
        DataCell(
          category.isFeatured
              ? Icon(Icons.favorite, color: Theme.of(context).primaryColor)
              : const Icon(Icons.favorite, color: Colors.grey),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => categories.length;

  @override
  int get selectedRowCount =>
      categories.where((final element) => element.isselcteed).length;
}

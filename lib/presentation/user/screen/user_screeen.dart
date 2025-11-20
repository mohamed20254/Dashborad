import 'dart:ui';

import 'package:admain_panel/model/user_model.dart';
import 'package:admain_panel/view_model/user_cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        color: Colors.white,
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserLodaing) {
              return Center(child: CircularProgressIndicator());
            } else if (state is UserFailure) {
              return Center(child: Text(state.message));
            }
            if (state is UsersFinished) {
              return ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.mouse,
                    PointerDeviceKind.touch,
                  },
                ),
                child: SingleChildScrollView(
                  child: PaginatedDataTable(
                    rowsPerPage: 10,

                    header: Text(
                      "Users",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    columns: [
                      DataColumn(label: Text("Uid")),
                      DataColumn(label: Text("Name")),
                      DataColumn(label: Text("email")),
                      DataColumn(label: Text("puone")),
                      DataColumn(label: Text("CratedAt ")),
                    ],
                    source: DataTableSourcesUSer(users: state.users),
                  ),
                ),
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}

class DataTableSourcesUSer extends DataTableSource {
  final List<UserModel> users;

  DataTableSourcesUSer({required this.users});
  @override
  DataRow? getRow(int index) {
    if (index >= users.length) return null;
    final user = users[index];
    return DataRow(
      selected: user.isselcted,
      onSelectChanged: (value) {
        user.isselcted = value ?? false;
        notifyListeners();
      },
      cells: [
        DataCell(Text(user.uid)),
        DataCell(Text(user.displayName)),
        DataCell(Text(user.email)),
        DataCell(Text(user.phone.toString())),
        DataCell(Text(user.createdAt.toString())),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => users.length;

  @override
  int get selectedRowCount =>
      users.where((element) => element.isselcted).length;
}

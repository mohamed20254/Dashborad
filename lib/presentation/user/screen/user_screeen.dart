import 'dart:ui';

import 'package:admain_panel/model/user_model.dart';
import 'package:admain_panel/presentation/user/widget/category_table.dart';
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
              return Categorytable(state: state);
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}

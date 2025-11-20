import 'package:admain_panel/app/di/injection_container.dart';
import 'package:admain_panel/presentation/auth/login_screen.dart';
import 'package:admain_panel/presentation/user/screen/user_screeen.dart';
import 'package:admain_panel/presentation/brands/screen/brand_screen.dart';
import 'package:admain_panel/presentation/categories/screen/categories_screen.dart';
import 'package:admain_panel/presentation/dashborad_screen/dashbord_screen.dart';
import 'package:admain_panel/presentation/main_screen/screen/main_scree.dart';
import 'package:admain_panel/presentation/order/screen/order_screen.dart';
import 'package:admain_panel/presentation/product/screen/product_screen.dart';
import 'package:admain_panel/view_model/auth_cubit/auth_cubit.dart';
import 'package:admain_panel/view_model/categories_cubit.dart/categories_cubit.dart';
import 'package:admain_panel/view_model/product_cubit/product_cubit.dart';
import 'package:admain_panel/view_model/user_cubit/user_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// =============================
// 1) Route Names
// =============================
class RouteNames {
  static const dashbordScreen = 'dashborad';
  static const products = 'products';
  static const categoriesScreen = 'categories';
  static const user = 'user';
  static const brandScreen = 'brand';
  static const orderScreen = 'order';
  static const login = 'login';
}

// =============================
// 2) Route Paths
// =============================
class RoutePaths {
  static const dashbordScreen = '/dashbordScreen';
  static const products = '/products';
  static const categoriesScreen = '/categoriesScreen';
  static const user = '/User';
  static const brandScreen = '/brandScreen';
  static const orderScreen = '/orderScreen';
  static const login = '/login';
}

// =============================
// 3) App Router
// =============================
class AppRouter {
  static final GoRouter router = GoRouter(
    // routerNeglect: true,
    initialLocation: RoutePaths.login,
    redirect: (final context, final state) {
      final isLoggedIn =
          FirebaseAuth.instance.currentUser != null &&
          FirebaseAuth.instance.currentUser!.uid ==
              "NtyqxptSswdqxkwRYURYGMS2LU43";
      final goingToLogin = state.matchedLocation == RoutePaths.login;

      if (!isLoggedIn && !goingToLogin) {
        return RoutePaths.login;
      }
      if (isLoggedIn && goingToLogin) {
        return RoutePaths.dashbordScreen;
      }
      return null; // No redirection
    },
    routes: [
      /// Login
      ShellRoute(
        builder: (final context, final state, final child) =>
            Mainscreen(child: child),
        routes: [
          // Home
          GoRoute(
            name: RouteNames.dashbordScreen,
            path: RoutePaths.dashbordScreen,
            builder: (final context, final state) => const DashbordScreen(),
          ),

          // Products List
          GoRoute(
            name: RouteNames.products,
            path: RoutePaths.products,
            builder: (final context, final state) => BlocProvider(
              create: (final context) => sl<ProductCubit>(),
              child: const ProductScreen(),
            ),
          ),
          //==category
          GoRoute(
            path: RoutePaths.categoriesScreen,
            name: RouteNames.categoriesScreen,
            builder: (final context, final state) => BlocProvider(
              create: (final context) => sl<CategoriesCubit>()..getCategory(),
              child: const CategoriesScreen(),
            ),
          ),
          //======baner
          GoRoute(
            path: RoutePaths.user,
            name: RouteNames.user,
            builder: (final context, final state) => BlocProvider(
              create: (final context) => sl<UserCubit>()..getUsers(),
              child: const UserScreen(),
            ),
          ),
          //=====brands
          GoRoute(
            path: RoutePaths.brandScreen,
            name: RouteNames.brandScreen,
            builder: (final context, final state) => const BrandScreen(),
          ),
          //oreder
          GoRoute(
            path: RoutePaths.orderScreen,
            name: RouteNames.orderScreen,
            builder: (final context, final state) => const OrderScreen(),
          ),
        ],
      ),
      GoRoute(
        name: RouteNames.login,
        path: RoutePaths.login,
        builder: (final context, final state) => BlocProvider(
          create: (final context) => sl<AuthCubit>(),
          child: const LoginScreen(),
        ),
      ),
    ],
  );
}

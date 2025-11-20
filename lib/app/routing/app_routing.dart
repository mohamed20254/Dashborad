import 'package:admain_panel/app/di/injection_container.dart';
import 'package:admain_panel/presentation/auth/login_screen.dart';
import 'package:admain_panel/presentation/banner/screen/banner_screeen.dart';
import 'package:admain_panel/presentation/brands/screen/brand_screen.dart';
import 'package:admain_panel/presentation/categories/screen/categories_screen.dart';
import 'package:admain_panel/presentation/dashborad_screen/dashbord_screen.dart';
import 'package:admain_panel/presentation/main_screen/screen/main_scree.dart';
import 'package:admain_panel/presentation/order/screen/order_screen.dart';
import 'package:admain_panel/presentation/product/screen/product_screen.dart';
import 'package:admain_panel/view_model/auth_cubit/auth_cubit.dart';
import 'package:admain_panel/view_model/product_cubit/product_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// =============================
// 1) Route Names
// =============================
class RouteNames {
  static const dashbordScreen = 'dashborad';
  static const products = 'products';
  static const categoriesScreen = 'categories';
  static const banner = 'banner';
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
  static const banner = '/banner';
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
    redirect: (context, state) {
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
        builder: (context, state, child) => Mainscreen(child: child),
        routes: [
          // Home
          GoRoute(
            name: RouteNames.dashbordScreen,
            path: RoutePaths.dashbordScreen,
            builder: (context, state) => DashbordScreen(),
          ),

          // Products List
          GoRoute(
            name: RouteNames.products,
            path: RoutePaths.products,
            builder: (context, state) => BlocProvider(
              create: (context) => sl<ProductCubit>(),
              child: ProductScreen(),
            ),
          ),
          //==category
          GoRoute(
            path: RoutePaths.categoriesScreen,
            name: RouteNames.categoriesScreen,
            builder: (context, state) => CategoriesScreen(),
          ),
          //======baner
          GoRoute(
            path: RoutePaths.banner,
            name: RouteNames.banner,
            builder: (context, state) => BannerScreeen(),
          ),
          //=====brands
          GoRoute(
            path: RoutePaths.brandScreen,
            name: RouteNames.brandScreen,
            builder: (context, state) => BrandScreen(),
          ),
          //oreder
          GoRoute(
            path: RoutePaths.orderScreen,
            name: RouteNames.orderScreen,
            builder: (context, state) => OrderScreen(),
          ),
        ],
      ),
      GoRoute(
        name: RouteNames.login,
        path: RoutePaths.login,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<AuthCubit>(),
          child: const LoginScreen(),
        ),
      ),
    ],
  );
}

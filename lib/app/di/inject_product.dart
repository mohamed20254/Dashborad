import 'package:admain_panel/repo/product_repo.dart';
import 'package:admain_panel/services/data_base_services.dart';
import 'package:admain_panel/view_model/product_cubit/product_cubit.dart';
import 'package:admain_panel/view_model/user_cubit/user_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

Future<void> injectProduct(final GetIt sl) async {
  //services
  sl.registerLazySingleton<ProductServices>(
    () => ProductServicesImpl(firebaseFirestore: FirebaseFirestore.instance),
  );
  //repo
  sl.registerLazySingleton<ProductRepo>(
    () => ProductRepoImpl(productservises: sl<ProductServices>()),
  );

  //cubit
  sl.registerFactory<ProductCubit>(() => ProductCubit(sl<ProductRepo>()));
  sl.registerFactory<UserCubit>(() => UserCubit(sl<ProductRepo>()));
}

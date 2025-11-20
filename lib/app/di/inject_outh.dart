import 'package:admain_panel/repo/auth_repo.dart';
import 'package:admain_panel/services/auth_services.dart';
import 'package:admain_panel/view_model/auth_cubit/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

Future<void> injectaouth(final GetIt sl) async {
  sl.registerLazySingleton<AuthServieces>(
    () => AuthServicesImpl(firebaseAuth: FirebaseAuth.instance),
  );
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(authServieces: sl<AuthServieces>()),
  );
  //cuibts
  sl.registerFactory<AuthCubit>(() => AuthCubit(sl<AuthRepo>()));
}

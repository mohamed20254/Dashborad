import 'package:admain_panel/app/di/inject_outh.dart';
import 'package:admain_panel/app/di/inject_product.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Register your dependencies here
  await injectaouth(sl);
  await injectProduct(sl);
}

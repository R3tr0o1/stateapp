import 'package:get_it/get_it.dart';
import 'package:stateapp/services/product_api.dart';
import 'package:stateapp/services/user_api.dart';

import '../models/crud_model.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton(() => ProductApi('products'));
  locator.registerLazySingleton(() => UserApi('user'));
  locator.registerLazySingleton(() => CRUDModel());
}

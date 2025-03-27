// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:mybekkar/Addmin_panel/Home_page/homr_view_model.dart';
import 'package:mybekkar/User_panel/screens/Service/Auth/google_auth.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../User_panel/screens/Add_To_Cart/Add_to_view_model.dart';
import '../User_panel/screens/Fire_base_service/auth_service.dart';
import '../User_panel/screens/Fire_base_service/login_register_viewmodel.dart';
import '../User_panel/screens/Profile/Components/profile_image_edit.dart';
import '../User_panel/screens/Service/Saller.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => Saller());
  locator.registerLazySingleton(() => AddToViewModel());
  locator.registerLazySingleton(() => HomrViewModeladdminn());
  locator.registerLazySingleton(() => LoginRegisterViewModel());
  locator.registerLazySingleton(() => AuthServices());
  locator.registerLazySingleton(() => GoogleAuth());
  locator.registerLazySingleton(() => profileImageEditModel());
}

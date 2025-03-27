import 'package:mybekkar/Addmin_panel/Home_page/homr_view_model.dart';
import 'package:mybekkar/User_panel/screens/Add_To_Cart/Add_to_view_model.dart';
import 'package:mybekkar/User_panel/screens/Fire_base_service/auth_service.dart';
import 'package:mybekkar/User_panel/screens/Fire_base_service/login_register_viewmodel.dart';
import 'package:mybekkar/User_panel/screens/Intro/Component/intro_4_page.dart';
import 'package:mybekkar/User_panel/screens/Service/Auth/google_auth.dart';
import 'package:mybekkar/User_panel/screens/Service/Saller.dart';
import 'package:mybekkar/User_panel/screens/splash_screens/splash_view.dart';
import 'package:stacked/stacked_annotations.dart';

import '../User_panel/screens/Profile/Components/profile_image_edit.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
    MaterialRoute(page: Intro4Page),
  ],
  dependencies: [
    // LazySingleton(classType: NavigationService),
    LazySingleton(classType: Saller),
    LazySingleton(classType: AddToViewModel),
    LazySingleton(classType: GoogleAuth),
    LazySingleton(classType: HomrViewModeladdminn),
    LazySingleton(classType: LoginRegisterViewModel),
    LazySingleton(classType: AuthServices),
    LazySingleton(classType: profileImageEditModel),
  ],
)
class AppSetup {}

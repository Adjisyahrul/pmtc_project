import 'package:get_it/get_it.dart';
import 'package:pmtc_project/login/services/login_services.dart';
import 'package:pmtc_project/services/navigation_service.dart';
class Locator {
  static GetIt locator = GetIt.instance;

  static void setup() {
    locator.registerLazySingleton(() => AuthService());
    // locator.registerLazySingleton(() => NavigationService());
  }
}
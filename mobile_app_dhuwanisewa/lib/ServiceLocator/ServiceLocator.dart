import 'package:get_it/get_it.dart';
import 'package:mobile_app_dhuwanisewa/Account/Service/AccountService.dart';
import 'package:mobile_app_dhuwanisewa/Commmon/SharedRefrence/SharedRefrence.dart';
import 'package:mobile_app_dhuwanisewa/Profile/ProfileService.dart';

final getIt = GetIt.instance;

setupServiceLocator() {
  getIt.registerLazySingleton<AccountService>(
      () => AccountServiceImplementation());

  getIt.registerLazySingleton<SharedReference>(
      () => SharedReferenceImplementation());

  getIt.registerLazySingleton<ProfileService>(
          () => ProfileServiceImplementation());
}

import 'package:get_it/get_it.dart';
import 'package:mobile_app_dhuwanisewa/Account/Service/AccountService.dart';

final getIt=GetIt.instance;

setupServiceLocator(){
  getIt.registerLazySingleton<IAccountService>(() => AccountService());
}
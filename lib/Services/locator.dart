import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';

final locator = GetIt.instance;

void setUpServices(){
  locator.registerLazySingleton(() => BottomSheetService()); //register logger as a service
  locator.registerLazySingleton<String>(() => "null"); //TODO: Form controller

}
import 'package:get_it/get_it.dart';
import 'package:sheardp/classes.dart';

GetIt getIt = GetIt.instance;

class DependancyInjection {
  void init() {
    getIt.registerLazySingleton<ApiService>(() => ApiService());
    getIt.registerLazySingleton<User>(() => User());
    getIt.registerLazySingleton<Person>(() => Person());
  }
}

import 'package:get_it/get_it.dart';
import 'package:oriontek_flutter/globals/data/datasource/local.datasource.dart';
import 'package:oriontek_flutter/globals/data/repository/local.repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;

class DependencyInjection {
  static Future<void> init() async {
    await _initExternal();
    _initCore();
    _initDataSource();
    _initRepository();
  }

  static _initExternal() async {
    final prefs = await SharedPreferences.getInstance();
    locator.registerLazySingleton(() => prefs);
    return;
  }

  static _initCore() {}

  static _initDataSource() {
    locator.registerLazySingleton<LocalDataSource>(
        () => LocalDataSourceImpl(storage: locator()));
  }

  static _initRepository() {
    locator.registerLazySingleton<LocalRepository>(
      () => LocalRepositoryImpl(localDataSource: locator()),
    );
  }
}

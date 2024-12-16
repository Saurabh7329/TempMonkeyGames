import 'package:freeplay/core/di/injections.config.dart';
import 'package:freeplay/core/local_storage/local_storage_service.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  preferRelativeImports: false,
  asExtension: false
)
Future<void> configureDependencies() async {
  await LocalStorage.init();

  $initGetIt(getIt);
}
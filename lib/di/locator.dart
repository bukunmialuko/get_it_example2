import 'package:get_it/get_it.dart';
import 'package:get_it_example2/domain/random_dog_controller.dart';
import 'package:get_it_example2/repository/random_dog_repo.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<RandomDogRepo>(
    () => RandomDogRepo(),
  );
  getIt.registerLazySingleton<RandomDogController>(
    () => RandomDogController(),
  );
}

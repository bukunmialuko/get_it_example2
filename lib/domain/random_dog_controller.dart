import 'package:get_it_example2/di/locator.dart';
import 'package:get_it_example2/repository/random_dog_repo.dart';

class RandomDogController {
  getRandomDog() async {
    return await getIt.get<RandomDogRepo>().getRandomDog();
  }
}

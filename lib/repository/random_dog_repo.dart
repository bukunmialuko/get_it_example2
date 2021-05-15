import 'dart:convert';

import 'package:get_it_example2/domain/model/random_dog_model.dart';
import 'package:http/http.dart' as http;

import 'endpoints.dart';

class RandomDogRepo {
  Future<RandomDogModel> getRandomDog() async {
    http.Response response = await http.get(Uri.parse(randomDogUrl));
    Map<String, dynamic> randomDogModelJson = jsonDecode(response.body);
    print("=====> RESPONSE: " + response.body);
    return RandomDogModel.fromJson(randomDogModelJson);
  }
}

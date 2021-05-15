class RandomDogModel {
  final String? message;
  final String? status;

  RandomDogModel(this.message, this.status);

  RandomDogModel.fromJson(Map<String, dynamic> json)
      : message = json["message"],
        status = json["status"];

  String getDogBreed() {
    // MESSAGE DATA EXAMPLE: "https://images.dog.ceo/breeds/samoyed/n02111889_1314.jpg";
    String breed =
        (message == null) ? "" : message!.substring(30, message!.length);
    print(breed);
    if (breed.isNotEmpty) {
      breed = breed.substring(0, breed.indexOf(RegExp(r'/')));
      print(breed);
    }
    return breed;
  }
}

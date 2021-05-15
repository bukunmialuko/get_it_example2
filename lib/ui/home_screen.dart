import 'package:flutter/material.dart';
import 'package:get_it_example2/di/locator.dart';
import 'package:get_it_example2/domain/model/random_dog_model.dart';
import 'package:get_it_example2/domain/random_dog_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RandomDogModel? visibleDog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DI with get_it"),
        centerTitle: true,
      ),
      body: Container(
          child: visibleDog == null
              ? Center(child: Text("No Dog loaded yet"))
              : Center(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "BREED:",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${visibleDog?.getDogBreed().toUpperCase()}",
                            style: TextStyle(fontSize: 22),
                          ),
                          SizedBox(height: 8),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                            child: Image.network(visibleDog?.message ?? "",
                                fit: BoxFit.fitWidth),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "API CALL: ${visibleDog?.status}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.skip_next),
        onPressed: () async {
          RandomDogModel model =
              await getIt.get<RandomDogController>().getRandomDog();
          setState(() {
            visibleDog = model;
          });
        },
      ),
    );
  }
}

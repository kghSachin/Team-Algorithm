import 'dart:convert';

import 'package:ghumfir/features/home/model/faous_place_model.dart';
import 'package:ghumfir/features/home/model/place_model.dart';
import "package:http/http.dart" as http;

Future<List<PlaceModel>?> getPlaces() async {
  print("pressed button");
  String url = "http://192.168.0.108:8000/api/listing/get";
  try {
    final response = await http.get(Uri.parse(url));
    print(response.body);
    if (response.statusCode != 200) {
      throw Exception("Failed to load places");
    }
    final data = json.decode(response.body);
    print(data["data"]);
    return data["data"]
        .map<PlaceModel>((place) => PlaceModel.fromMap(place))
        .toList();

    // print(response.body);
  } catch (e) {
    throw Exception("Failed to load places");
  }

  // return await http.get(Uri.parse(url)).then((response) {

  //   if (response.statusCode == 200) {
  //     List<dynamic> data = json.decode(response.body);
  //     return data.map((place) => PlaceModel.fromMap(place)).toList();
  //   } else {

  //     throw Exception("Failed to load places");
  //   }
  // });
}

Future<List<FamousPlaceModel>?> getFamousPlace(int id) async {
  try {
    String url = "http://192.168.0.108:8000/api/listing/get/";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final res = jsonDecode(response.body);
      print(res);
      return res["data"]
          .map<FamousPlaceModel>((place) => FamousPlaceModel.fromMap(place))
          .toList();
    }
    return null;
  } catch (error) {
    throw Exception("Failed to load famous places");
  }
}

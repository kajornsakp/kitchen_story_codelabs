import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kitchen_story/models.dart';

class KitchenService {
  static const BASE_URL =
      "https://asia-southeast1-flutter-workshop-3f555.cloudfunctions.net";

  Future<Recommendation> loadRecommendations() async {
    var response = await http.get(Uri.parse("$BASE_URL/recommendations"));
    if (response.statusCode != 200) {
      throw Exception("Can't load recommendations");
    } else {
      final jsonResponse = json.decode(response.body);
      Recommendation recommendation = new Recommendation.fromJson(jsonResponse);
      return recommendation;
    }
  }

  Future<Categories> loadCategories() async {
    var response = await http.get(Uri.parse("$BASE_URL/categories"));
    if (response.statusCode != 200) {
      throw Exception("Can't load categories");
    } else {
      final jsonResponse = json.decode(response.body);
      Categories categories = new Categories.fromJson(jsonResponse);
      return categories;
    }
  }
}

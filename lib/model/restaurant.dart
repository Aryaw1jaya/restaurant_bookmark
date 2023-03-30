import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcometoJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  List<Restaurant> restaurants;

  Welcome({
    required this.restaurants,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        restaurants: List<Restaurant>.from(
            json["restaurants"].map((x) => Restaurant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
      };
}

class Restaurant {
  late String id;
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late double rating;
  late Menus menus;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  Restaurant.fromJson(Map<String, dynamic> restaurant) {
    id = restaurant['id'];
    name = restaurant['name'];
    description = restaurant['description'];
    pictureId = restaurant['pictureId'];
    city = restaurant['city'];
    rating = restaurant['rating'].toDouble();
    menus = Menus.fromJson(restaurant['menus']);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "city": city,
        "rating": rating,
        "menus": menus.toJson(),
      };
}

class Menus {
  List<Foods> foods;
  List<Drinks> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        foods: List<Foods>.from(json["foods"].map((x) => Foods.fromJson(x))),
        drinks:
            List<Drinks>.from(json["drinks"].map((x) => Drinks.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
        "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
      };
}

class Foods {
  late String name;

  Foods({
    required this.name,
  });

  factory Foods.fromJson(Map<String, dynamic> json) => Foods(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Drinks {
  late String name;

  Drinks({
    required this.name,
  });

  factory Drinks.fromJson(Map<String, dynamic> json) => Drinks(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

List<Restaurant> parseRestaurants(String? json) {
  if (json == null) {
    return [];
  }

  print(jsonDecode(json)['restaurants']);
  final List<Restaurant> restaurants =
      Welcome.fromJson(jsonDecode(json)).restaurants;
  return restaurants;
}

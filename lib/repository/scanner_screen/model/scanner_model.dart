// To parse this JSON data, do
//
//     final searchResultResModel = searchResultResModelFromJson(jsonString);

import 'dart:convert';

List<SearchResultResModel> searchResultResModelFromJson(String str) =>
    List<SearchResultResModel>.from(json.decode(str).map((x) => SearchResultResModel.fromJson(x)));

String searchResultResModelToJson(List<SearchResultResModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchResultResModel {
  String? img;
  String? name;
  int? quantity;
  int? price;

  SearchResultResModel({
    this.img,
    this.name,
    this.quantity,
    this.price,
  });

  factory SearchResultResModel.fromJson(Map<String, dynamic> json) => SearchResultResModel(
        img: json["img"],
        name: json["name"],
        quantity: json["quantity"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "img": img,
        "name": name,
        "quantity": quantity,
        "price": price,
      };
}

import 'package:flutter/material.dart';
import 'package:ifystore_app_withapi/models/category_model.dart';
import 'dart:convert';

class ProductsModel with ChangeNotifier {
  int? id;
  String? title;
  int? price;
  String? description;
  CategoriesModel? category;
  List<String>? images;
  int? categoryId;

  ProductsModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.images,
      this.categoryId});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = (json['category'] != null
        ? CategoriesModel.fromJson(json['category'])
        : null)!;
    images = json['images'].cast<String>();
    categoryId = json['categoryId'];
  }
  static List<ProductsModel> productsFromJson(List productJson) {
    // print("data ${productJson[0]}");
    return productJson.map((data) {
      return ProductsModel.fromJson(data);
    }).toList();
  }
}

// // To parse this JSON data, do

// //
// //     final productsModel = productsModelFromJson(jsonString);
//
// import 'dart:convert';
//
// List<ProductsModel> productsModelFromJson(String str) =>
//     List<ProductsModel>.from(
//         json.decode(str).map((x) => ProductsModel.fromJson(x)));
//
// String productsModelToJson(List<ProductsModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class ProductsModel {
//   ProductsModel({
//     this.id,
//     this.title,
//     this.price,
//     this.description,
//     this.category,
//     this.images,
//     this.categoryId,
//   });
//
//   int id;
//   String title;
//   int price;
//   String description;
//   Category category;
//   List<String> images;
//   int categoryId;
//
//   factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
//         id: json["id"] == null ? null : json["id"],
//         title: json["title"] == null ? null : json["title"],
//         price: json["price"] == null ? null : json["price"],
//         description: json["description"] == null ? null : json["description"],
//         category: json["category"] == null
//             ? null
//             : Category.fromJson(json["category"]),
//         images: json["images"] == null
//             ? null
//             : List<String>.from(json["images"].map((x) => x)),
//         categoryId: json["categoryId"] == null ? null : json["categoryId"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id == null ? null : id,
//         "title": title == null ? null : title,
//         "price": price == null ? null : price,
//         "description": description == null ? null : description,
//         "category": category == null ? null : category.toJson(),
//         "images":
//             images == null ? null : List<dynamic>.from(images.map((x) => x)),
//         "categoryId": categoryId == null ? null : categoryId,
//       };
// }
//
// class Category {
//   Category({
//     this.id,
//     this.name,
//     this.image,
//     this.keyLoremSpace,
//   });
//
//   int id;
//   Name name;
//   String image;
//   String keyLoremSpace;
//
//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//         id: json["id"] == null ? null : json["id"],
//         name: json["name"] == null ? null : nameValues.map[json["name"]],
//         image: json["image"] == null ? null : json["image"],
//         keyLoremSpace:
//             json["keyLoremSpace"] == null ? null : json["keyLoremSpace"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id == null ? null : id,
//         "name": name == null ? null : nameValues.reverse[name],
//         "image": image == null ? null : image,
//         "keyLoremSpace": keyLoremSpace == null ? null : keyLoremSpace,
//       };
// }
//
// enum Name { CLOTHES, OTHERS, FURNITURE, ELECTRONICS, SHOES }
//
// final nameValues = EnumValues({
//   "Clothes": Name.CLOTHES,
//   "Electronics": Name.ELECTRONICS,
//   "Furniture": Name.FURNITURE,
//   "Others": Name.OTHERS,
//   "Shoes": Name.SHOES
// });
//
// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }

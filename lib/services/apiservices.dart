import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ifystore_app_withapi/consts/api_const.dart';
import 'package:ifystore_app_withapi/models/category_model.dart';
import 'package:ifystore_app_withapi/models/product_model.dart';

class ApiServices {
  static Future<List<dynamic>> getData({required String target}) async {
    var uri = Uri.https(BASE_URL, "api/v1/$target");
    var response = await http.get(uri);

    // print("response ${jsonDecode(response.body)}");

    var data = jsonDecode(response.body);

    List tempList = [];
    for (var v in data) {
      tempList.add(v);
    }
    return tempList;
  }

  static Future<List<ProductsModel>> getAllProducts() async {
    List temp = await getData(target: "products");
    return ProductsModel.productsFromJson(temp);
  }

  static Future<List<CategoriesModel>> getAllCategories() async {
    List temp = await getData(target: "categories");
    return CategoriesModel.categoriesFromJson(temp);
  }
}

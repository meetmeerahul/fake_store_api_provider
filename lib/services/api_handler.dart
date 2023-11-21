import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_api_flutter_course/consts/api_consts.dart';
import 'package:store_api_flutter_course/models/categories_model.dart';
import 'package:store_api_flutter_course/models/products_model.dart';
import 'package:store_api_flutter_course/models/user_model.dart';

class APIHAndler {
  static Future<List<dynamic>> getdata({required String target}) async {
    var uri = Uri.https(BASE_URL, "api/v1/$target");
    var response = await http.get(uri);

    var data = jsonDecode(response.body);

    List tempList = [];
    for (var v in data) {
      tempList.add(v);
    }
    return tempList;
  }

  static Future<List<ProductsModel>> getAllProducts() async {
    var tempList = await getdata(target: "products");
    return ProductsModel.getProductsJson(tempList);
  }

  static Future<List<CategoriesModel>> getAllCategories() async {
    var tempList = await getdata(target: "categories");
    return CategoriesModel.getCategoriesJson(tempList);
  }

  static Future<List<UserModel>> getUserDetails() async {
    var tempList = await getdata(target: "users");

    print(tempList);
    return UserModel.getUserDetails(tempList);
  }

  static Future<ProductsModel> getProductsById({required String id}) async {
    var uri = Uri.https(BASE_URL, "api/v1/products/$id");
    var response = await http.get(uri);

    var data = jsonDecode(response.body);

    return ProductsModel.fromJson(data);
  }
}

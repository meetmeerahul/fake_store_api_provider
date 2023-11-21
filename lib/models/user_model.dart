import 'package:flutter/foundation.dart';

class UserModel with ChangeNotifier {
  int? id;
  String? email;
  String? password;
  String? name;
  String? role;
  String? avatar;
  String? creationAt;
  String? updatedAt;

  UserModel(
      {this.id,
      this.email,
      this.password,
      this.name,
      this.role,
      this.avatar,
      this.creationAt,
      this.updatedAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    role = json['role'];
    avatar = json['avatar'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }

  //   static List<ProductsModel> getProductsJson(List productsJson) {
  //   return productsJson.map((data) {
  //     return ProductsModel.fromJson(data);
  //   }).toList();
  // }

  static List<UserModel> getUserDetails(List userJson) {
    return userJson.map((data) {
      return UserModel.fromJson(data);
    }).toList();
  }
}

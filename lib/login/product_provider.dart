import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:project1/login/product_model.dart';

Future<List<Product>> productProvider() async {
  List<Product> products = [];
  int total = 0;
  Dio dio = Dio();
  Response response = await dio.get("https://dummyjson.com/products");
  try {
    final data = response.data;
    total = data['total'];
    products = (data['products'] as List)
        .map((productJson) => Product.fromJson(productJson))
        .toList();
    return products;
  } catch (error) {
    throw error;
  }
}
// Future<List<Product>>
 userLogin(
    {required String userName, required String password}) async {
  String baseUrl = "https://dummyjson.com";
  Dio dio = Dio();
  FormData formData =
      FormData.fromMap({"username": userName, "password": password});

  try {
    Response response = await dio.post("$baseUrl/auth/login",data: formData);
    if( response.statusCode == null || response.statusCode! > 300)
      {
        log('Login failed with status code: ${response.statusCode}');
        return false;
      }
    else return true;
  }  catch (error) {
    // Log the error and return false
    log('Error during login: $error');
    return false;
  }
}

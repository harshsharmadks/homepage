import 'package:flutter/material.dart';
import 'package:homepage/models/product.dart';


class RemoteServices{
  static var client = http.Client();

  static get http => null;

  static Future<Product?> fetchProducts() async{
   var response =  await client.get('https://appapi.dishakiran.com/api/v1/app/home?languageId=1');

   if (response.statusCode == 200){
     var jsonString = response.body;
    return productFromJson(jsonString);
   }
   else{
     return null;
   }
  }

}
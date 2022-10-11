import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:homepage/models/product.dart';
import 'package:homepage/services/remote_services.dart';


class ProductController extends GetxController {
  var productList = <Product>[].obs;

  @override
 void onInit(){
    fetchProducts();
    super.onInit();
  }


  void fetchProducts()  async{

var products = await RemoteServices.fetchProducts();

if (products != null){
  productList.value = products as List<Product>;

}
  }

}
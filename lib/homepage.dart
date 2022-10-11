import'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:homepage/controllers/product_controller.dart';
import 'package:homepage/views/product_tile.dart';


class Homepage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
title: Text('Languages'),
// actions: [
//   Image.asset('ic_logo.webp'),
//   Padding(padding: EdgeInsets.symmetric(horizontal: 300),child: Icon(Icons.menu,),)
// ],backgroundColor: Colors.blue,
//       ),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: const [
                Expanded(
                  child: Text(
                    'Welcome to Homepage',
                    style: TextStyle(
                        fontFamily: 'avenir',
                        fontSize: 32,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
          ),
            Expanded(
              child: Obx(()=> StaggeredGridView.countBuilder(crossAxisCount: 2,
                    itemCount: productController.productList.length,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    itemBuilder: (context,index){
                  return ProductTile(productController.productList[index]);

                }, staggeredTileBuilder:(index)=> const StaggeredTile.fit (1)),
              ),
            )
        ],
      ),
    );
  }
}

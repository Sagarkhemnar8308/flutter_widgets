import 'package:flutter/material.dart';
import 'package:flutter_widget/getx/getxfile.dart';
import 'package:get/get.dart';


class HomePage extends StatelessWidget {

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
  final ProductController productController = Get.put(ProductController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading:const Icon(
          Icons.arrow_back_ios,
        ),
        actions: [
          IconButton(
            icon:const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Learn with pradeep',
                    style: TextStyle(
                        fontFamily: 'avenir',
                        fontSize: 32,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.view_list_rounded), onPressed: () {}),
                IconButton(icon: Icon(Icons.grid_view), onPressed: () {}),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (productController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1 / 1.5),
                  itemCount: productController.productList.length,
                  itemBuilder: (context, i) =>
                     Column(
                       children: [
                         Text( productController.productList[i].name.toString()),
                         
                      Text( productController.productList[i].products?[2].shopName.toString() ?? ""),
                       ],
                     ),
                );
              }
            }),
          )
        ],
      ),
    );
  }
}
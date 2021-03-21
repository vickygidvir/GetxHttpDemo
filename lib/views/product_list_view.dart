import 'package:cosmoapp/controllers/product_controller.dart';
import 'package:cosmoapp/views/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ProductListView extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Finding Products..."),
      ),
      body: Obx(
        () {
          if (productController.isLoading.value)
            return Center(
              child: CircularProgressIndicator(),
            );
          else
            return ListView.builder(
              itemCount: productController.productList.length,
              itemBuilder: (context, index) {
                return ProductTile(product: productController.productList[index],);
              },
            );
        },
      ),
    );
  }
}

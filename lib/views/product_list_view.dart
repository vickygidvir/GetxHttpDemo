import 'package:cosmoapp/controllers/product_controller.dart';
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
                return Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 100,
                          width: 150,
                          margin: EdgeInsets.fromLTRB(16, 8, 8, 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              productController.productList[index].imageLink,
                              width: 150,
                              height: 100,
                              fit: BoxFit.fill,
                              color: Colors.amberAccent,
                              colorBlendMode: BlendMode.color,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Column(
                            children: [
                              Text(
                                productController.productList[index].name,
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                productController.productList[index].brand,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                productController.productList[index].category,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      color: Colors.grey.shade200,
                      height: 2,
                    ),
                  ],
                );
              },
            );
        },
      ),
    );
  }
}

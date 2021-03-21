import 'package:cosmoapp/model/product.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  product.imageLink,
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
                    product.name,
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    product.brand,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    product.category,
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
  }
}

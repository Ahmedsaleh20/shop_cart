import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_cart/widgets/cataloge_products.dart';

import 'cart_screen.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Column(
        children: [
          CatalogProduct(),
          ElevatedButton(
              onPressed: () => Get.to(() => CartScreen()),
              child: const Text('Go To Cart'))
        ],
      )),
    );
  }
}

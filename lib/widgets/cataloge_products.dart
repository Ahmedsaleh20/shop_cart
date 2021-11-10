import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_cart/controller/cart_controller.dart';
import 'package:shop_cart/controller/product_controller.dart';

class CatalogProduct extends StatelessWidget {
  final productController = Get.put(ProductController());

  CatalogProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
   Flexible(
        child: ListView.builder(
          itemCount: productController.product.length,
          itemBuilder: (BuildContext context, int index) =>
              CatalogProductCard(index: index),
        ),
      ),
    );
  }
}

class CatalogProductCard extends StatelessWidget {
  final cartController = Get.put(CartController());
  final ProductController productController = Get.find();
  final int? index;

  CatalogProductCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage:
                NetworkImage(productController.product[index!].image!),
          ),
          Text(
            productController.product[index!].name!,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text('${productController.product[index!].price!}'),
          IconButton(
              onPressed: () {
                cartController.addProduct(productController.product[index!]);
              },
              icon: const Icon(Icons.add))
        ],
      ),
    );
  }
}

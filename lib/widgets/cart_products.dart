import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_cart/controller/cart_controller.dart';
import 'package:shop_cart/model/product_model.dart';

class CartProducts extends StatelessWidget {
  final CartController controller = Get.find();

  CartProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox.fromSize( size: Size(400, 500,),
      child: ListView.builder(
            itemCount: controller.product.length!,
            itemBuilder: (BuildContext context, int ?index) {
              return CartProductCard(
                controller: controller,
                product: controller.product.keys.toList()[index],
                quantity: controller.product.values.toList()[index],
                index: index,
              );
            },
          ),)
        );
  }
}

class CartProductCard extends StatelessWidget {
  final CartController controller;
  final Product product;
  final int quantity;
  final int? index;

  const CartProductCard(
      {Key? key,
      required this.controller,
      required this.product,
      required this.quantity,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(product.image!),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(child: Text(product.name!)),
          IconButton(
              onPressed: () {
                controller.removeProduct(product);

                },

              icon: const Icon(Icons.remove_circle)),
          Text('$quantity'),
          IconButton(
              onPressed: () {
                controller.addProduct(product);
              },
              icon: const Icon(Icons.add_circle)),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_cart/widgets/cart_products.dart';
import 'package:shop_cart/widgets/cart_total.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [CartProducts(), CartTotal()],
      ),
    );
  }
}

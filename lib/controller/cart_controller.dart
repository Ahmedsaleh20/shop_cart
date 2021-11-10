import 'package:get/get.dart';
import 'package:shop_cart/model/product_model.dart';

class CartController extends GetxController {
  final _products = {}.obs;

  void addProduct(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }

    Get.snackbar(
        'Product Added', 'You have Added the ${product.name} to the Cart',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2));
  }

  void removeProduct(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    }else  {
      _products[product] -= 1;
    }
  }

  get product => _products;

  get productSubTotal =>
      _products.entries.map((product) => product.key.price * product.value).toList();

  get total => _products.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}

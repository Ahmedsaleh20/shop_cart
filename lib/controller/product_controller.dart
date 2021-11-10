import 'package:get/get.dart';
import 'package:shop_cart/model/product_model.dart';
import 'package:shop_cart/service/firebase_db.dart';

class ProductController extends GetxController {
  final product = <Product>[].obs;

  @override
  void onInit() {
    product.bindStream(FirestoreDB().getAllProducts());
    super.onInit();
  }
}

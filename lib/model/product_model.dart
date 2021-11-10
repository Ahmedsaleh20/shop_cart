import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String? name;
  final String? image;
  final double? price;

  const Product({
    required this.name,
    required this.image,
    required this.price,
  });

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product =
        Product(name: snap['name'], image: snap['image'], price: snap['price']);
    return product;
  }

// static const List<Product> products = [
//   Product(
//     name: 'Apple',
//     image:
//         'https://sc04.alicdn.com/kf/UTB8L4HPotnJXKJkSaiyq6AhwXXam.jpg',
//     price: 1.99,
//   ),
//   Product(
//     name: 'Orange',
//     image:
//         'https://tawseeloman.com/wp-content/uploads/2020/12/orange_tawseeloman.jpg',
//     price: 2.59,
//   ),
//   Product(
//     name: 'Pear',
//     image:
//         'https://www.bigbasket.com/media/uploads/p/l/40048444_3-fresho-pear-green-imported.jpg',
//     price: 3.59,
//   )
// ];
}

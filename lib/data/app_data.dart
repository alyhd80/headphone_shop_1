import 'dart:ui';

class Product {
  final Color color;
  final String path;

  Product({required this.color, required this.path});
}


List<Product> products = [
  Product(
    color: const Color(0xff000000),
    path: 'assets/black.png',
  ),
  Product(
    color: const Color(0xfffcecd0),
    path: 'assets/cream.png',
  ),
  Product(
    color: const Color(0xffb6d7e4),
    path: 'assets/blue.png',
  ),
];


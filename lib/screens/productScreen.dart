import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final String imagePath;
  final Color color; // Use the custom gray color

  Product({
    required this.name,
    required this.price,
    required this.imagePath,
    this.color = const Color.fromARGB(255, 191, 191, 191), // Use the custom gray color as the default
  });
}

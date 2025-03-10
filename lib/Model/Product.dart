import 'dart:convert';

class Product {
  final int id;
  final String name;
  final String brand;
  final String category;
  final double price;
  final String description;
  final String? imageUrl; // Assuming imageFileName can be converted to a URL

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.category,
    required this.price,
    required this.description,
    this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      brand: json['brand'] ?? "Unknown",
      category: json['category'] ?? "General",
      price: json['price'].toDouble(),
      description: json['description'] ?? "No description",
      imageUrl: json['imageFileName'] != null
          ? "https://yourdomain.com/images/${json['imageFileName']}"
          : null,
    );
  }
}

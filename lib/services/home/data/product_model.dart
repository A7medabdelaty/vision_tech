class Product {
  final int id;
  final String imageUrl;
  final String title;
  final String description;
  final double price;
  final String category;
  final double rate;

  Product({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.rate,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      imageUrl: json['image_url'],
      title: json['name'],
      description: json['description'],
      category: json['category'],
      rate: (json['rate'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
    );
  }
}

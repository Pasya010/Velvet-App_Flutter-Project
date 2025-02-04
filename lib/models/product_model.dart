class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final List<dynamic> images;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      images: List<dynamic>.from(json['images']),
    );
  }
}

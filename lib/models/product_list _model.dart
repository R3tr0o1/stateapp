class Product {
  String? id;
  String name;
  String description;
  String price;

  Product({
    required this.name,
    required this.description,
    required this.price,
    this.id,
  });

  Product.fromMap(Map<String, dynamic> snapshot, String id)
      : id = id,
        name = snapshot['name'] ?? ' ',
        description = snapshot['description'] ?? '',
        price = snapshot['price'] ?? '';

  toJson() {
    return {"name": name, "description": description, "price": price};
  }
}

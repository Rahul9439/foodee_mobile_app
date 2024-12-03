// Model class to represent each CategoryModel
class CategoryModel {
  String name;
  int color;
  String imagePath;
  String? price;
  String? totalPrice;
  int? quantity;

  CategoryModel(
      {required this.name,
      required this.color,
      required this.imagePath,
        this.quantity,
        this.totalPrice,
      this.price});

  // Factory constructor to create a CategoryModel from a JSON object
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'],
      color: json['color'],
      imagePath: json['imagePath'],
      price: json['price'],
      totalPrice: json['total_price'],
      quantity: json['quantity']
    );
  }
}


// Model class to represent each CategoryModel
class CategoryModel {
   String name;
   int color;
   String imagePath;

  CategoryModel({
    required this.name,
    required this.color,
    required this.imagePath,
  });

  // Factory constructor to create a CategoryModel from a JSON object
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'],
      color: json['color'],
      imagePath: json['imagePath'],
    );
  }
}

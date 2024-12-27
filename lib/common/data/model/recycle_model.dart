/// Recycle item dataclass
class RecycleModel {
  /// Constructor
  RecycleModel({
    required this.id,
    required this.name,
    required this.image,
    required this.explain,
    required this.persentage,
    required this.carbonRatio,
  });

  /// ID
  final int id;

  /// Name
  final String name;

  /// Image
  final String image;

  /// Explain
  final String explain;

  /// Percentage
  final String persentage;

  /// Carbon Ratio
  final int carbonRatio;

  /// Factory method to create an instance from JSON
  factory RecycleModel.fromJson(Map<String, dynamic> json) {
    return RecycleModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      explain: json['explain'],
      persentage: json['persentage'],
      carbonRatio: json['carbonRatio'],
    );
  }

  /// Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'explain': explain,
      'persentage': persentage,
      'carbonRatio': carbonRatio,
    };
  }
}
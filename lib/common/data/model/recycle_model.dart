class RecycleModel {
  RecycleModel({
    required this.id,
    required this.name,
    required this.image,
    required this.explain,
    required this.persentage,
    required this.carbonRatio,
  });

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

  final int carbonRatio;
  final String explain;
  final int id;
  final String image;
  final String name;
  final String persentage;

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

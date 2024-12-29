import 'package:hive/hive.dart';

part 'recycle_model.g.dart';

@HiveType(typeId: 0)
class RecycleModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String image;

  @HiveField(3)
  final String explain;

  @HiveField(4)
  final String persentage;

  @HiveField(5)
  final int carbonRatio;

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
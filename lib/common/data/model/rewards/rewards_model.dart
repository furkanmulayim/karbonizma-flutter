import 'package:hive/hive.dart';

part 'rewards_model.g.dart';

@HiveType(typeId: 3)
class RewardsModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String tokenID;

  @HiveField(2)
  final int compare;

  @HiveField(3)
  final String text;

  @HiveField(4)
  final String notCompletedImageUrl;

  @HiveField(5)
  final String completedImageUrl;

  @HiveField(6)
  final String tokentype;

  RewardsModel({
    required this.id,
    required this.tokenID,
    required this.compare,
    required this.text,
    required this.notCompletedImageUrl,
    required this.completedImageUrl,
    required this.tokentype,
  });

  factory RewardsModel.fromJson(Map<String, dynamic> json) {
    return RewardsModel(
      id: json['id'],
      tokenID: json['tokenID'],
      compare: json['compare'],
      text: json['text'],
      notCompletedImageUrl: json['notCompletedImageUrl'],
      completedImageUrl: json['completedImageUrl'],
      tokentype: json['tokentype'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tokenID': tokenID,
      'compare': compare,
      'text': text,
      'notCompletedImageUrl': notCompletedImageUrl,
      'completedImageUrl': completedImageUrl,
      'tokentype': tokentype,
    };
  }
}

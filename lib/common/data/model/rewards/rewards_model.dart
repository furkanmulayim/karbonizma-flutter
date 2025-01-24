import 'package:hive/hive.dart';

part 'rewards_model.g.dart';

@HiveType(typeId: 3)
class RewardsModel extends HiveObject {
  @HiveField(0)
  final int compare;

  @HiveField(1)
  final String text;

  @HiveField(2)
  final String notCompletedImageUrl;

  @HiveField(3)
  final String completedImageUrl;

  @HiveField(4)
  final String tokenType;

  RewardsModel({
    required this.compare,
    required this.text,
    required this.notCompletedImageUrl,
    required this.completedImageUrl,
    required this.tokenType,
  });

  factory RewardsModel.fromJson(Map<String, dynamic> json) {
    return RewardsModel(
      compare: json['compare'],
      text: json['text'],
      notCompletedImageUrl: json['notCompletedImageUrl'],
      completedImageUrl: json['completedImageUrl'],
      tokenType: json['tokenType'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'compare': compare,
      'text': text,
      'notCompletedImageUrl': notCompletedImageUrl,
      'completedImageUrl': completedImageUrl,
      'tokenType': tokenType,
    };
  }
}

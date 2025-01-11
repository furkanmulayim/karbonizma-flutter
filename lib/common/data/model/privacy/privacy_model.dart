import 'package:hive/hive.dart';

part 'privacy_model.g.dart';

@HiveType(typeId: 4)
class PrivacyModel extends HiveObject {
  @HiveField(0)
  final String devName;

  @HiveField(1)
  final String devTitle;

  @HiveField(2)
  final String devComm;

  @HiveField(3)
  final String devGithub;

  @HiveField(4)
  final String devGithubIco;

  @HiveField(5)
  final String devLinkedin;

  @HiveField(6)
  final String devLinkedinIcon;

  @HiveField(7)
  final String kvkkTitle;

  @HiveField(8)
  final String kvkk;

  PrivacyModel({
    required this.devName,
    required this.devTitle,
    required this.devComm,
    required this.devGithub,
    required this.devGithubIco,
    required this.devLinkedin,
    required this.devLinkedinIcon,
    required this.kvkkTitle,
    required this.kvkk,
  });

  factory PrivacyModel.fromJson(Map<String, dynamic> json) {
    return PrivacyModel(
      devName: json['devName'] as String,
      devTitle: json['devTitle'] as String,
      devComm: json['devComm'] as String,
      devGithub: json['devGithub'] as String,
      devGithubIco: json['devGithubIco'] as String,
      devLinkedin: json['devLinkedin'] as String,
      devLinkedinIcon: json['devLinkedinIcon'] as String,
      kvkkTitle: json['kvkk_title'] as String,
      kvkk: json['kvkk'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'devName': devName,
      'devTitle': devTitle,
      'devComm': devComm,
      'devGithub': devGithub,
      'devGithubIco': devGithubIco,
      'devLinkedin': devLinkedin,
      'devLinkedinIcon': devLinkedinIcon,
      'kvkk_title': kvkkTitle,
      'kvkk': kvkk,
    };
  }

  static List<PrivacyModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => PrivacyModel.fromJson(json)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<PrivacyModel> models) {
    return models.map((model) => model.toJson()).toList();
  }
}
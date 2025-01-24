class RemainingModel {
  String remainingPoint;
  String details;
  String showingImage;

  // Constructor
  RemainingModel({
    required this.remainingPoint,
    required this.details,
    required this.showingImage,
  });

  // Named constructor to create an instance from a map (useful for JSON parsing)
  factory RemainingModel.fromMap(Map<String, dynamic> map) {
    return RemainingModel(
      remainingPoint: map['remainingPoint'] ?? '',
      details: map['details'] ?? '',
      showingImage: map['showingImage'] ?? '',
    );
  }

  // Convert the instance to a map (useful for JSON encoding)
  Map<String, dynamic> toMap() {
    return {
      'remainingPoint': remainingPoint,
      'details': details,
      'showingImage': showingImage,
    };
  }
}

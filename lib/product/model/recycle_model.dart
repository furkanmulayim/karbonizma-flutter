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

  /// image
  final String image;
  
  /// Explain
  final String explain;

  /// Percentage
  final String persentage;

  /// Carbon Ratio
  final int carbonRatio;
  }

// car_version.dart
class CarVersion {
  final int id;
  final String model;
  final int year;
  final String price;
  final int horsePower;
  final CarVersionImage image;
  final CarSpecs specs;

  CarVersion({
    required this.id,
    required this.model,
    required this.year,
    required this.price,
    required this.horsePower,
    required this.image,
    required this.specs,
  });

  factory CarVersion.fromJson(Map<String, dynamic> json) {
    return CarVersion(
      id: json['id'] as int? ?? 0,
      model: json['model'] as String? ?? '',
      year: json['year'] as int? ?? 0,
      price: json['price'] as String? ?? '',
      horsePower: json['horsePower'] as int? ?? 0,
      image: CarVersionImage.fromJson(json['image'] as Map<String, dynamic>? ?? {}),
      specs: CarSpecs.fromJson(json['specs'] as Map<String, dynamic>? ?? {}),
    );
  }
}

class CarVersionImage {
  final String main;
  final String thumb;
  final List<String> gallery;
  final List<ColorVariant> versions;

  CarVersionImage({
    required this.main,
    required this.thumb,
    required this.gallery,
    required this.versions,
  });

  factory CarVersionImage.fromJson(Map<String, dynamic> json) {
    return CarVersionImage(
      main: json['main'] as String? ?? '',
      thumb: json['thumb'] as String? ?? '',
      gallery: List<String>.from(json['gallery'] as List? ?? []),
      versions: (json['versions'] as List? ?? [])
          .map((e) => ColorVariant.fromJson(e as Map<String, dynamic>? ?? {}))
          .toList(),
    );
  }
}

class ColorVariant {
  final String color;
  final String image;

  ColorVariant({required this.color, required this.image});

  factory ColorVariant.fromJson(Map<String, dynamic> json) {
    return ColorVariant(
      color: json['color'] as String? ?? '',
      image: json['image'] as String? ?? '',
    );
  }
}

class CarSpecs {
  final String engine;
  final String topSpeed;
  final String acceleration;
  final String fuelType;
  final String transmission;

  CarSpecs({
    required this.engine,
    required this.topSpeed,
    required this.acceleration,
    required this.fuelType,
    required this.transmission,
  });

  factory CarSpecs.fromJson(Map<String, dynamic> json) {
    return CarSpecs(
      engine: json['engine'] as String? ?? 'N/A',
      topSpeed: json['topSpeed'] as String? ?? 'N/A',
      acceleration: json['acceleration'] as String? ?? 'N/A',
      fuelType: json['fuelType'] as String? ?? 'N/A',
      transmission: json['transmission'] as String? ?? 'N/A',
    );
  }
}
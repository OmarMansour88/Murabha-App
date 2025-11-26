// class CarModel {
//   final String name;
//   final String slug;
//   final ImageUrls image;

//   CarModel({required this.name, required this.slug, required this.image});

//   factory CarModel.fromJson(Map<String, dynamic> json) {
//     return CarModel(
//       name: json['name'],
//       slug: json['slug'],
//       image: ImageUrls.fromJson(json['image']),
//     );
//   }
// }

// class ImageUrls {
//   final String source;
//   final String thumb;
//   final String optimized;
//   final String original;
//   final String localThumb;
//   final String localOptimized;
//   final String localOriginal;

//   ImageUrls({
//     required this.source,
//     required this.thumb,
//     required this.optimized,
//     required this.original,
//     required this.localThumb,
//     required this.localOptimized,
//     required this.localOriginal,
//   });

//   factory ImageUrls.fromJson(Map<String, dynamic> json) {
//     return ImageUrls(
//       source: json['source'],
//       thumb: json['thumb'],
//       optimized: json['optimized'],
//       original: json['original'],
//       localThumb: json['localThumb'],
//       localOptimized: json['localOptimized'],
//       localOriginal: json['localOriginal'],
//     );
//   }
// }

// class CarModel {
//   final String name;
//   final String slug;
//   final String origin;
//   final int founded;
//   final String description;
//   final List<String> popularModels;
//   final String website;
//   final ImageUrls image;

//   CarModel({
//     required this.name,
//     required this.slug,
//     required this.origin,
//     required this.founded,
//     required this.description,
//     required this.popularModels,
//     required this.website,
//     required this.image,
//   });

//   factory CarModel.fromJson(Map<String, dynamic> json) {
//     return CarModel(
//       name: json['name'],
//       slug: json['slug'],
//       origin: json['origin'],
//       founded: json['founded'],
//       description: json['description'],
//       popularModels: List<String>.from(json['popular_models']),
//       website: json['website'],
//       image: ImageUrls.fromJson(json['image']),
//     );
//   }
// }

// class ImageUrls {
//   final String source;
//   final String thumb;
//   final String optimized;
//   final String original;
//   final String localThumb;
//   final String localOptimized;
//   final String localOriginal;

//   ImageUrls({
//     required this.source,
//     required this.thumb,
//     required this.optimized,
//     required this.original,
//     required this.localThumb,
//     required this.localOptimized,
//     required this.localOriginal,
//   });

//   factory ImageUrls.fromJson(Map<String, dynamic> json) {
//     return ImageUrls(
//       source: json['source'],
//       thumb: json['thumb'],
//       optimized: json['optimized'],
//       original: json['original'],
//       localThumb: json['localThumb'],
//       localOptimized: json['localOptimized'],
//       localOriginal: json['localOriginal'],
//     );
//   }
// }

class CarModel {
  final int id;
  final String model;
  final int year;
  final String price;
  final int horsePower;
  final CarImage image;
  final CarSpecs specs;

  CarModel({
    required this.id,
    required this.model,
    required this.year,
    required this.price,
    required this.horsePower,
    required this.image,
    required this.specs,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'],
      model: json['model'],
      year: json['year'],
      price: json['price'],
      horsePower: json['horsePower'],
      image: CarImage.fromJson(json['image']),
      specs: CarSpecs.fromJson(json['specs']),
    );
  }
}

class CarImage {
  final String main;
  final String thumb;
  final List<String> gallery;

  CarImage({required this.main, required this.thumb, required this.gallery});

  factory CarImage.fromJson(Map<String, dynamic> json) {
    return CarImage(
      main: json['main'],
      thumb: json['thumb'],
      gallery: List<String>.from(json['gallery']),
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
      engine: json['engine'],
      topSpeed: json['topSpeed'],
      acceleration: json['acceleration'],
      fuelType: json['fuelType'],
      transmission: json['transmission'],
    );
  }
}

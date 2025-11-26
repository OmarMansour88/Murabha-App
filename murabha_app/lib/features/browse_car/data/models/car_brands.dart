class CarBrand {
  final String name;
  final String slug;
  final ImageUrls image;

  CarBrand({required this.name, required this.slug, required this.image});

  factory CarBrand.fromJson(Map<String, dynamic> json) {
    return CarBrand(
      name: json['name'],
      slug: json['slug'],
      image: ImageUrls.fromJson(json['logo']),
    );
  }
}

class ImageUrls {
  final String source;
  final String thumb;
  final String optimized;
  final String original;
  final String localThumb;
  final String localOptimized;
  final String localOriginal;

  ImageUrls({
    required this.source,
    required this.thumb,
    required this.optimized,
    required this.original,
    required this.localThumb,
    required this.localOptimized,
    required this.localOriginal,
  });

  factory ImageUrls.fromJson(Map<String, dynamic> json) {
    return ImageUrls(
      source: json['source'],
      thumb: json['thumb'],
      optimized: json['optimized'],
      original: json['original'],
      localThumb: json['localThumb'],
      localOptimized: json['localOptimized'],
      localOriginal: json['localOriginal'],
    );
  }
}

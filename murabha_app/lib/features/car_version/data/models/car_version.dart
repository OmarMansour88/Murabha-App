class CarVersion {
  final String model;
  final int year;
  final double price;
  final double kilometer;
  final String category;
  final String status;
  final String bodyStyle;

  CarVersion({
    required this.model,
    required this.year,
    required this.price,
    required this.kilometer,
    required this.category,
    required this.status,
    required this.bodyStyle, required int stock,
  });
}

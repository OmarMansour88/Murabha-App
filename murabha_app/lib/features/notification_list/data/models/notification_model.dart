class NotificationModel{
  final String title;
  final String message;
  final DateTime timestamp;

  NotificationModel({
    required this.title,
    required this.message,
    required this.timestamp,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      title: json['title'],
      message: json['message'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}
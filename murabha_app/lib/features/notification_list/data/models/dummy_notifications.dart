import 'package:murabha_app/features/notification_list/data/models/notification_model.dart';

final List<NotificationModel> dummyNotifications = [
  NotificationModel(
    title: "Hamoudi",
    message: "Hi Mohamed Amr",
    timestamp: DateTime.now().subtract(Duration(minutes: 5)),
  ),
  NotificationModel(
    title: "New Car",
    message: "Check out the latest car models in your area.",
    timestamp: DateTime.now().subtract(Duration(hours: 1)),
  ),
  NotificationModel(
    title: "Payment Reminder",
    message: "Don’t forget your July installment.",
    timestamp: DateTime.now().subtract(Duration(days: 1)),
  ),
  NotificationModel(
    title: "Limited Offer",
    message: "Get 15% off on your car insurance this week.",
    timestamp: DateTime.now().subtract(Duration(days: 2)),
  ),
];

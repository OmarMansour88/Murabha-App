import 'package:flutter/material.dart';
import 'package:murabha_app/features/notification_list/ui/widgets/notify_list.dart';

class NotificationListScreen extends StatelessWidget {
  const NotificationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: NotificationList()));
  }
}

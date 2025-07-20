import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';
import 'package:murabha_app/features/notification_list/data/models/dummy_notifications.dart';
import 'package:murabha_app/features/notification_list/data/models/notification_model.dart';
import 'package:murabha_app/features/notification_list/ui/widgets/notification_item.dart';

class NotificationList extends StatefulWidget {
  const NotificationList({super.key});

  @override
  State<NotificationList> createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  late List<NotificationModel> notifications;

  @override
  void initState() {
    super.initState();
    notifications = List.from(dummyNotifications); // clone the static list
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: notifications.isEmpty
          ? Center(
              child: Text(
                '🎉 No notifications left!',
                style: TextStyleManager.font12GreyMedium.copyWith(
                  fontSize: 16.sp,
                ),
              ),
            )
          : ListView.separated(
              itemCount: notifications.length,
              padding: EdgeInsets.all(18.sp),
              separatorBuilder: (context, index) => SizedBox(height: 16.sp),
              itemBuilder: (context, index) {
                final item = notifications[index];

                return Dismissible(
                  key: ValueKey(item.title + item.timestamp.toIso8601String()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      notifications.removeAt(index);
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Deleted: ${item.title}'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  background: Container(
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(12.sp),
                    ),
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 20.sp),
                    child: const Icon(
                      Icons.delete_outline,
                      color: Colors.white,
                    ),
                  ),
                  child: NotificationItem(notification: item),
                );
              },
            ),
    );
  }
}

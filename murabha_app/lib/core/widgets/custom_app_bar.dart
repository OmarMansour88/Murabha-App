import 'package:flutter/material.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final Color backgroundColor; 
  final Color iconColor;
  final TextStyle? titleTextStyle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.backgroundColor = Colors.transparent,
    this.iconColor = Colors.white,
    this.titleTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // <-- Prevents default back button
      leading: showBackButton
          ? IconButton(
              icon: Icon(Icons.arrow_back, color: iconColor), 
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          : null,
      backgroundColor: backgroundColor,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: titleTextStyle ?? TextStyleManager.font20BlackBold,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

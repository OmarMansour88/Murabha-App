import 'package:flutter/material.dart';
import 'package:murabha_app/core/widgets/navigation_bar.dart';

class BrowseCar extends StatelessWidget {
  const BrowseCar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("data")),
      bottomNavigationBar: AppUniversalBottomNavBar(index: 1),
    );
  }
}

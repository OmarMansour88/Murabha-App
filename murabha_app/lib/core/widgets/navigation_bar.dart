import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/themes/colors_manager.dart';
import 'package:murabha_app/features/browse_car/ui/browse_car.dart';
import 'package:murabha_app/features/home/ui/home_screen.dart';

class AppUniversalBottomNavBar extends StatefulWidget {
  final int? index;
  AppUniversalBottomNavBar({this.index});

  @override
  State<AppUniversalBottomNavBar> createState() =>
      _AppUniversalBottomNavBarState(index: index);
}

class _AppUniversalBottomNavBarState extends State<AppUniversalBottomNavBar> {
  final int? index;
  List<bool> chosenIndex = [false, false, false, false];
  _AppUniversalBottomNavBarState({required this.index});

  @override
  void initState() {
    for (int i = 0; i < chosenIndex.length; i++) {
      if (i == index) {
        chosenIndex[i] = true;
      } else {
        chosenIndex[i] = false;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      // shape: shape,
      height: 80,
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3), // Shadow position
              ),
            ],
          ),

          child: IconTheme(
            data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  color: chosenIndex[0]
                      ? Colors.white
                      : ColorsManager.primaryColor,
                  tooltip: 'Open navigation menu',
                  icon: const Icon(Icons.home),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            HomeScreen(),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ),
                    );
                    // setState(() {
                    //   for (int i = 0; i < chosenIndex.length; i++) {}
                    // });
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      chosenIndex[0]
                          ? ColorsManager.primaryColor
                          : Colors.white,
                    ),
                  ),
                ),
                // if (centerLocations.contains(fabLocation)) const Spacer(),
                IconButton(
                  color: chosenIndex[1]
                      ? Colors.white
                      : ColorsManager.primaryColor,
                  tooltip: 'Search',
                  icon: const Icon(Icons.car_rental),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            BrowseCar(),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ),
                    );
                    // setState(() {
                    //   for (int i = 0; i < chosenIndex.length; i++) {
                    //     if (i == 1) {
                    //       chosenIndex[i] = true;
                    //     } else {
                    //       chosenIndex[i] = false;
                    //     }
                    //   }
                    // });
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      chosenIndex[1]
                          ? ColorsManager.primaryColor
                          : Colors.white,
                    ),
                  ),
                ),
                // Container(width: 48.w, child: const SizedBox.shrink()),
                IconButton(
                  color: chosenIndex[2]
                      ? Colors.white
                      : ColorsManager.primaryColor,
                  tooltip: 'Favorite',
                  icon: const Icon(Icons.paste_rounded),
                  onPressed: () {
                    // setState(() {
                    //   for (int i = 0; i < chosenIndex.length; i++) {
                    //     if (i == 2) {
                    //       chosenIndex[i] = true;
                    //     } else {
                    //       chosenIndex[i] = false;
                    //     }
                    //   }
                    //   print(chosenIndex);
                    // });
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      chosenIndex[2]
                          ? ColorsManager.primaryColor
                          : Colors.white,
                    ),
                  ),
                ),
                IconButton(
                  color: chosenIndex[3]
                      ? Colors.white
                      : ColorsManager.primaryColor,
                  tooltip: 'Favorite',
                  icon: const Icon(Icons.account_circle_outlined),
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      chosenIndex[3]
                          ? ColorsManager.primaryColor
                          : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/di/dependency_injection.dart';
import 'package:murabha_app/core/routing/app_router.dart';
import 'package:murabha_app/murabha_app.dart';

void main() async {
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(MurabhaApp(appRouter: AppRouter()));
}

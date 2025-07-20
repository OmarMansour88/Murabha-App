import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murabha_app/core/di/dependency_injection.dart';
import 'package:murabha_app/core/routing/routes.dart';
import 'package:murabha_app/features/browse_car/ui/browse_car.dart';
import 'package:murabha_app/features/car_application/ui/application_form.dart';
import 'package:murabha_app/features/home/ui/home_Screen.dart';
import 'package:murabha_app/features/login/logic/login/cubit/login_cubit_cubit.dart';
import 'package:murabha_app/features/login/logic/otp/cubit/otp_cubit.dart';
import 'package:murabha_app/features/login/ui/login/login_screen.dart';
import 'package:murabha_app/features/login/ui/otp/otp_screen.dart';
import 'package:murabha_app/features/onboarding/ui/onboarding_screen.dart';
import 'package:murabha_app/features/carList/ui/list_of_car_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.carBrowseScreen:
        return MaterialPageRoute(builder: (_) => BrowseCar());
      case Routes.otpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<OtpCubit>(),
            child: OtpScreen(),
          ),
        );
      case Routes.applicationForm:
        return MaterialPageRoute(builder: (_) => ApplicationForm());
      case Routes.listCarScreen:
        return MaterialPageRoute(builder: (_) => ListOfCarScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

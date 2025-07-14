import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:murabha_app/core/networking/api_service.dart';
import 'package:murabha_app/core/networking/dio_factory.dart';
import 'package:murabha_app/features/login/data/repo/login_repo.dart';
import 'package:murabha_app/features/login/logic/cubit/login_cubit_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //Dio & ApiService
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  //Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}

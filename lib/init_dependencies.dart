import 'package:get_it/get_it.dart';
import 'package:snap_it/core/themes/bloc/theme_bloc.dart';
import 'package:snap_it/features/onboard/data/data_source/local/onboard_local_datasource.dart';
import 'package:snap_it/features/onboard/data/repository/onboard_repository_impl.dart';
import 'package:snap_it/features/onboard/domain/repository/onboard_repository.dart';
import 'package:snap_it/features/onboard/domain/usecase/load_app_usecase.dart';
import 'package:snap_it/features/onboard/presentation/bloc/onboard_bloc.dart';

GetIt serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initTheme();
  _initOnboard();
}

_initTheme() {
  serviceLocator.registerLazySingleton<ThemeBloc>(() => ThemeBloc());
}

_initOnboard() {
  serviceLocator
    ..registerFactory<OnboardLocaldatasource>(
      () => OnboardLocaldatasourceImpl(),
    )
    ..registerFactory<OnboardRepository>(
      () => OnboardRepositoryImpl(serviceLocator()),
    )
    ..registerFactory<LoadAppUsecase>(
      () => LoadAppUsecase(serviceLocator()),
    )
    ..registerFactory<OnboardBloc>(
      () => OnboardBloc(loadAppUsecase: serviceLocator()),
    );
}

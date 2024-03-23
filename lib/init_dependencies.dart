import 'package:get_it/get_it.dart';
import 'package:snap_it/core/secrets/supabase_secrets.dart';
import 'package:snap_it/core/themes/bloc/theme_bloc.dart';
import 'package:snap_it/features/auth/data/data_source/remote/auth_remote_datasource.dart';
import 'package:snap_it/features/auth/data/repository/auth_repository_impl.dart';
import 'package:snap_it/features/auth/domain/repository/auth_repository.dart';
import 'package:snap_it/features/auth/domain/usecase/login_usecase.dart';
import 'package:snap_it/features/auth/domain/usecase/register_usecase.dart';
import 'package:snap_it/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:snap_it/features/onboard/data/data_source/local/onboard_local_datasource.dart';
import 'package:snap_it/features/onboard/data/repository/onboard_repository_impl.dart';
import 'package:snap_it/features/onboard/domain/repository/onboard_repository.dart';
import 'package:snap_it/features/onboard/domain/usecase/load_app_usecase.dart';
import 'package:snap_it/features/onboard/presentation/bloc/onboard_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

GetIt serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initTheme();
  _initOnboard();
  _initAuth();

  final supabase = await Supabase.initialize(
    url: SupabaseSecrets.supabaseUrl,
    anonKey: SupabaseSecrets.supabaseAnonKey,
  );

  serviceLocator.registerLazySingleton<SupabaseClient>(() => supabase.client);
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

_initAuth() {
  serviceLocator
    ..registerFactory<AuthRemoteDatasource>(
      () => AuthRemoteDatasourceImpl(serviceLocator()),
    )
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(serviceLocator()),
    )
    ..registerFactory<RegisterUsecase>(
      () => RegisterUsecase(serviceLocator()),
    )
    ..registerFactory<LoginUsecase>(
      () => LoginUsecase(serviceLocator()),
    )
    ..registerFactory<AuthBloc>(
      () => AuthBloc(
        registerUsecase: serviceLocator(),
        loginUsecase: serviceLocator(),
      ),
    );
}

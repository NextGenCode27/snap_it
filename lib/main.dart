import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_it/core/secrets/storage_secrets.dart';
import 'package:snap_it/core/services/shared_pref.dart';
import 'package:snap_it/core/themes/bloc/theme_bloc.dart';
import 'package:snap_it/core/themes/dark_theme.dart';
import 'package:snap_it/core/themes/light_theme.dart';
import 'package:snap_it/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:snap_it/features/onboard/presentation/bloc/onboard_bloc.dart';
import 'package:snap_it/features/onboard/presentation/views/onboard_view.dart';
import 'package:snap_it/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isDarkMode = await SharedPref().getBool(themeKey) ?? false;
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => serviceLocator<ThemeBloc>()),
        BlocProvider(create: (context) => serviceLocator<OnboardBloc>()),
        BlocProvider(create: (context) => serviceLocator<AuthBloc>()),
      ],
      child: MyApp(
        isDarkMode: isDarkMode,
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.isDarkMode});
  final bool isDarkMode;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeBloc, ThemeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ThemeInitial) {
          if (widget.isDarkMode == true) {
            context
                .read<ThemeBloc>()
                .add(ThemeChangeEvent(themeData: lightMode));
          } else if (widget.isDarkMode == false) {
            context
                .read<ThemeBloc>()
                .add(ThemeChangeEvent(themeData: darkMode));
          }
        }

        if (state is ThemeSuccess) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'S N A P I T',
            theme: state.themeData,
            darkTheme: darkMode,
            home: const OnBoardView(),
          );
        }
        return const SizedBox();
      },
    );
  }
}

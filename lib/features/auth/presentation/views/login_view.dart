import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_it/core/global/widgets/loader.dart';
import 'package:snap_it/core/secrets/storage_secrets.dart';
import 'package:snap_it/core/services/shared_pref.dart';
import 'package:snap_it/core/themes/bloc/theme_bloc.dart';
import 'package:snap_it/core/themes/dark_theme.dart';
import 'package:snap_it/core/themes/light_theme.dart';
import 'package:snap_it/core/utils/show_snackbar.dart';
import 'package:snap_it/features/auth/domain/usecase/login_usecase.dart';
import 'package:snap_it/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:snap_it/features/auth/presentation/views/forgot_view.dart';
import 'package:snap_it/features/auth/presentation/views/register_view.dart';
import 'package:snap_it/features/auth/presentation/widgets/auth_button.dart';
import 'package:snap_it/features/auth/presentation/widgets/auth_textformfield.dart';

class LoginView extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const LoginView());
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isDarkMode = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  toggle() {
    isDarkMode = !isDarkMode;
    if (isDarkMode) {
      context.read<ThemeBloc>().add(ThemeChangeEvent(themeData: lightMode));
      SharedPref().setBool(key: themeKey, value: isDarkMode);
    } else if (!isDarkMode) {
      context.read<ThemeBloc>().add(ThemeChangeEvent(themeData: darkMode));
      SharedPref().setBool(key: themeKey, value: isDarkMode);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              if (state is ThemeSuccess) {
                return IconButton(
                  onPressed: () {
                    toggle();
                  },
                  icon: state.themeData == darkMode
                      ? Icon(
                          Icons.light_mode,
                          color: Theme.of(context).colorScheme.primary,
                        )
                      : Icon(
                          Icons.dark_mode,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            showSnackbar(context, 'User Login Successfully');
          }
          if (state is AuthFailed) {
            showSnackbar(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Loader();
          }
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(size.width / 10),
              height: size.height,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Auth Logo
                  Column(
                    children: [
                      Icon(
                        Icons.lock_open,
                        color: Theme.of(context).colorScheme.primary,
                        size: 75,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //Auth Slogan
                      Text(
                        'Login with your valid and registered credentials!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2.0,
                        ),
                      )
                    ],
                  ),

                  //Auth Input
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AuthTextFormField(
                          controller: emailController,
                          textInputType: TextInputType.emailAddress,
                          hintText: 'EMAIL',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AuthTextFormField(
                          controller: passwordController,
                          textInputType: TextInputType.visiblePassword,
                          hintText: 'PASSWORD',
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(ForgotView.route());
                          },
                          child: Text(
                            'FORGOT?',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Auth Button
                  AuthButton(
                    size: size,
                    lable: 'LOGIN',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                              LoginEvent(
                                loginParams: LoginParams(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                ),
                              ),
                            );
                      }
                    },
                  ),
                  //Not a member
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(RegisterView.route());
                        },
                        child: Text(
                          'Register Now!',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

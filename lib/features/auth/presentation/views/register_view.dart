import 'package:flutter/material.dart';
import 'package:snap_it/features/auth/presentation/widgets/auth_button.dart';
import 'package:snap_it/features/auth/presentation/widgets/auth_textformfield.dart';

class RegisterView extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const RegisterView());
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
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
                    'Register with your valid credentials and continue!',
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
                      controller: usernameController,
                      hintText: 'USERNAME',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AuthTextFormField(
                      controller: emailController,
                      hintText: 'EMAIL',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AuthTextFormField(
                      controller: phoneController,
                      hintText: 'PHONE',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AuthTextFormField(
                      controller: passwordController,
                      hintText: 'PASSWORD',
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              //Auth Button
              AuthButton(
                size: size,
                lable: 'REGISTER',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
              ),
              //Not a member
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already a member?',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Login Now!',
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
      ),
    );
  }
}

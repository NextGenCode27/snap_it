import 'package:flutter/material.dart';
import 'package:snap_it/features/auth/presentation/widgets/auth_button.dart';
import 'package:snap_it/features/auth/presentation/widgets/auth_textformfield.dart';

class ForgotView extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const ForgotView());
  const ForgotView({super.key});

  @override
  State<ForgotView> createState() => _ForgotViewState();
}

class _ForgotViewState extends State<ForgotView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
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
                    'Enter your email address, we will send you a password reset link on your registered email address.',
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
                      hintText: 'EMAIL',
                    ),

                    //Auth Button
                  ],
                ),
              ),
              AuthButton(
                size: size,
                lable: 'SEND EMAIL',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
              ),
              //Not a member
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Back to',
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
                      'Login!',
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

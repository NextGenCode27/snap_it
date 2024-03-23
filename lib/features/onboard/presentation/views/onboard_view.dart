import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_it/features/auth/presentation/views/login_view.dart';
import 'package:snap_it/features/onboard/presentation/bloc/onboard_bloc.dart';
import 'package:snap_it/features/onboard/presentation/widgets/onboard_logo_box.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OnboardBloc, OnboardState>(
        listener: (context, state) {
          if (state is OnboardSuccess) {
            Navigator.of(context)
                .pushAndRemoveUntil(LoginView.route(), (route) => false);
          }
        },
        builder: (context, state) {
          if (state is OnboardInitial) {
            context.read<OnboardBloc>().add(LoadAppEvent());
          }
          return const Center(
            child: OnBoardLogoBox(),
          );
        },
      ),
    );
  }
}

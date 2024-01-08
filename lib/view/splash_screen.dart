import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakila_store_project/bloc/auth/auth_bloc.dart';

import 'package:sakila_store_project/core/theme/colors.dart';
import 'package:sakila_store_project/view/home_page.dart';
import 'package:sakila_store_project/view/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: BlocProvider(
        create: (context) => AuthBloc()..add(LoggedIn()),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthAuthenticated) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const HomePage(),
                ),
              );
            }
            if (state is AuthUnauthenticated) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const LoginPage(),
                ),
              );
            }
          },
          child: Center(
            child: Image.asset(
              'assets/app-icon-big.png',
              width: 200.0,
              height: 200.0,
            ),
          ),
        ),
      ),
    );
  }
}

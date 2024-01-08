import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakila_store_project/bloc/login/login_bloc.dart';

import 'package:sakila_store_project/core/theme/colors.dart';
import 'package:sakila_store_project/view/home_page.dart';
import 'package:sakila_store_project/widgets/custom_button.dart';
import 'package:sakila_store_project/widgets/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        }
        if (state is LoginError) {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => Dialog(
              child: Padding(
                padding: const EdgeInsets.all(64.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(state.error),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Close'),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      }, builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 32.0,
            right: 32.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/app-icon-big.png',
                  width: 160.0,
                  height: 160.0,
                ),
              ),
              const SizedBox(height: 30.0),
              CustomTextField(
                controller: _emailController,
                text: 'Email',
                hintText: '',
                radiusValue: 8.0,
              ),
              const SizedBox(height: 20.0),
              CustomTextField(
                controller: _passwordController,
                text: 'Password',
                hintText: '',
                radiusValue: 8.0,
              ),
              const SizedBox(height: 50.0),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  color: AppColors.secondaryColor,
                  onPressed: () {
                    context.read<LoginBloc>().add(
                          Login(
                              email: _emailController.text,
                              password: _passwordController.text),
                        );
                  },
                  radiusValue: 20.0,
                  widget: state is LoginLoading
                      ? const Center(
                          child: SizedBox(
                              height: 20.0,
                              width: 20.0,
                              child: CircularProgressIndicator()),
                        )
                      : const Text('Masuk'),
                  enableBorderSide: false,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

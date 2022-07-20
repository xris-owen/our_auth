import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_auth/src/cubit/cubit.dart';
import 'package:our_auth/src/repositories/auth_repository.dart';
import 'package:our_auth/src/screens/auth/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocProvider(
          create: (_) => LoginCubit(
            context.read<AuthRepository>(),
          ),
          child: const LoginForm(),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.loginStatus == LoginStatus.error) {
          // Handle the error
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          _EmailInput(),
          SizedBox(height: 8),
          _PasswordInput(),
          SizedBox(height: 24),
          _LoginBtn(),
          SizedBox(height: 8),
          _SignupBtn(),
        ],
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: ((previous, current) => previous.password != current.password),
      builder: (context, state) {
        return TextField(
          onChanged: (password) {
            context.read<LoginCubit>().passwordChanged(password);
          },
          decoration: const InputDecoration(labelText: 'Password'),
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: ((previous, current) => previous.email != current.email),
      builder: (context, state) {
        return TextField(
          onChanged: (email) {
            context.read<LoginCubit>().emailChanged(email);
          },
          decoration: const InputDecoration(labelText: 'Email'),
        );
      },
    );
  }
}

class _LoginBtn extends StatelessWidget {
  const _LoginBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: ((previous, current) =>
          previous.loginStatus != current.loginStatus),
      builder: (context, state) {
        return state.loginStatus == LoginStatus.submitting
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  context.read<LoginCubit>().loginWithCredentials();
                },
                child: const Text('Login'),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(200, 0),
                ),
              );
      },
    );
  }
}

class _SignupBtn extends StatelessWidget {
  const _SignupBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.of(context).push<void>(SignupScreen.route()),
      child: const Text(
        'Create account',
        style: TextStyle(
          color: Colors.blue,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        fixedSize: const Size(200, 0),
      ),
    );
  }
}

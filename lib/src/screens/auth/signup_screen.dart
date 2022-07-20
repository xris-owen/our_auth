import 'package:flutter/material.dart';
import 'package:our_auth/src/screens/auth/auth_components/custom_button.dart';
import 'package:our_auth/src/screens/auth/auth_components/email_input.dart';
import 'package:our_auth/src/screens/auth/auth_components/password_input.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SignupScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: SignupForm(),
      ),
    );
  }
}

class SignupForm extends StatelessWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        // EmailInput(),
        SizedBox(height: 8),
        // PasswordInput(),
        SizedBox(height: 8),
        SignupBtn(),
      ],
    );
  }
}

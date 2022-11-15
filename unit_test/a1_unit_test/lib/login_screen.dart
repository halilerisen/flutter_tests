import 'package:flutter/material.dart';

import 'validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              key: const ValueKey('email_id'),
              decoration: const InputDecoration(hintText: 'Enter Email Id'),
              validator: (String? value) => Validator.validateEmail(email: value ?? ''),
            ),
            TextFormField(
              controller: _passwordController,
              key: const ValueKey('password'),
              decoration: const InputDecoration(hintText: 'Enter Password'),
              validator: (String? value) => Validator.validatePassword(password: value ?? ''),
            ),
            ElevatedButton(
              onPressed: () {
                _formKey.currentState?.validate();
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

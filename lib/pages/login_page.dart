import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ftt151attendant/controllers/auth_controller.dart';
import 'package:ftt151attendant/controllers/login_controller.dart';
import 'package:ftt151attendant/pages/splash_page.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../helpers/validator.dart';
import '../widgets/input_form_with_icon.dart';

class LoginPage extends StatefulWidget {
  static const String route = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    AuthController authController = Provider.of(context);

    if (authController.isAuthenticated()) {
      GoRouter.of(context).go(SplashPage.route);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body:
          Consumer<LoginController>(builder: (context, loginController, child) {
        return Form(
          key: loginController.loginFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 48.0,
                    ),
                    InputFormWithIcon(
                      controller: loginController.emailTextEditingController,
                      iconPrefix: Icons.email,
                      labelText: 'Enter Email',
                      validator: ((value) => Validator.email(value)),
                      onChanged: ((value) => loginController.onChange()),
                      onSaved: ((value) => loginController
                          .emailTextEditingController.text = value!),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    InputFormWithIcon(
                      controller: loginController.passwordTextEditingController,
                      iconPrefix: Icons.password_rounded,
                      labelText: 'Enter Password',
                      isObscureText: true,
                      validator: ((value) => Validator.password(value)),
                      onChanged: ((value) => loginController.onChange()),
                      onSaved: ((value) => loginController
                          .passwordTextEditingController.text = value!),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                onPressed: () async {
                                  if (loginController.loginFormKey.currentState!
                                      .validate()) {
                                    log("formkey invalid!");
                                  }
                                  authController.login(
                                      loginController
                                          .emailTextEditingController.text
                                          .trim(),
                                      loginController
                                          .passwordTextEditingController.text
                                          .trim());
                                },
                                child: const Text('Sign In')),
                          ),
                          const SizedBox(
                            width: 40.0,
                          ),
                          Expanded(
                            child: ElevatedButton(
                                onPressed: () async {
                                  if (loginController.loginFormKey.currentState!
                                      .validate()) {
                                    log("formkey invalid!");
                                  }
                                  authController.register(
                                      loginController
                                          .emailTextEditingController.text
                                          .trim(),
                                      loginController
                                          .passwordTextEditingController.text
                                          .trim());
                                },
                                child: const Text('Sign Up')),
                          ),
                        ])
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

import 'package:care_giver/pages/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/theme.dart';
import '../../controller/auth_controller.dart';
import '../../widget/dialogs.dart';
import '../../widget/password_form_field.dart';
import '../../widget/text_form_field.dart';
import '../home.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _contactFocus = FocusNode();
  final FocusNode _passwordConfirmFocus = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 1 / 7,
                child: Center(
                  child: Text(
                    'Care Giver Admin Registration',
                    style: AppTheme.lightTheme.textTheme.headline6,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormFieldWidget(
                        controller: _usernameController,
                        focusNode: _usernameFocus,
                        textInputAction: TextInputAction.next,
                        labelText: 'Username',
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(_contactFocus);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Username is required';
                          } else if (value.contains(' ')) {
                            return 'Username cannot contain spaces';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormFieldWidget(
                        controller: _contactController,
                        focusNode: _contactFocus,
                        textInputAction: TextInputAction.next,
                        labelText: 'Gmail or Phone Number',
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(_passwordFocus);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Contact is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PasswordFormFieldWidget(
                        controller: _passwordController,
                        focusNode: _passwordFocus,
                        textInputAction: TextInputAction.next,
                        labelText: "Password",
                        obscureText: true,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context)
                              .requestFocus(_passwordConfirmFocus);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password is required';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PasswordFormFieldWidget(
                        controller: _passwordConfirmController,
                        focusNode: _passwordConfirmFocus,
                        labelText: "Password",
                        obscureText: true,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).unfocus();
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Confirm Password is required';
                          } else if (value.length < 6) {
                            return 'Confirm Password must be at least 6 characters';
                          } else if (value != _passwordController.text) {
                            return 'Password does not match';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton.icon(
                        style: AppTheme.elevatedButtonStyle(context),
                        onPressed: () => _register(),
                        icon: const Icon(Icons.login),
                        label: const Text("Done"),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Already has an account?'),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: () => Get.offAll(() => LoginPage()),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: AppTheme.septenary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () => Get.back(),
                  child: const Text(
                    "Go back",
                    style: TextStyle(
                      color: AppTheme.septenary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _register() {
    if (_formKey.currentState!.validate()) {
      showLoadingDialog();
      Get.find<AuthController>()
          .register(_usernameController.text, _passwordController.text,
              _contactController.text)
          .then(
        (value) {
          dismissDialog();
          Get.offAll(
            () => HomePage(
              username: value,
            ),
          );
          showSuccessMessage("Register Success");
        },
      ).catchError((e) {
        dismissDialog();
        showErrorMessage(e.toString());
      });
    }
  }
}

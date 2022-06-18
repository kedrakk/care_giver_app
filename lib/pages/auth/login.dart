import 'package:care_giver/const/theme.dart';
import 'package:care_giver/controller/auth_controller.dart';
import 'package:care_giver/pages/home.dart';
import 'package:care_giver/widget/dialogs.dart';
import 'package:care_giver/widget/password_form_field.dart';
import 'package:care_giver/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _usernameFocus = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Care Giver',
              style: AppTheme.lightTheme.textTheme.headline6,
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
                        FocusScope.of(context).requestFocus(_passwordFocus);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Username is required';
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
                      labelText: "Password",
                      obscureText: true,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).unfocus();
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
                    child: ElevatedButton.icon(
                      style: AppTheme.elevatedButtonStyle(context),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          showLoadingDialog();
                          Get.find<AuthController>()
                              .login(_usernameController.text,
                                  _passwordController.text)
                              .then(
                            (value) {
                              dismissDialog();
                              Get.offAll(
                                () => HomePage(
                                  username: value,
                                ),
                              );
                            },
                          ).catchError((e) {
                            dismissDialog();
                            showErrorMessage(e.toString());
                          });
                        }
                      },
                      icon: const Icon(Icons.login),
                      label: const Text("Login"),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Not Registered?'),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () => Get.offAll(
                    () => const HomePage(username: ""),
                  ),
                  child: const Text(
                    "Go to Newsfeed",
                    style: TextStyle(
                      color: AppTheme.septenary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

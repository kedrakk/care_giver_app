import 'package:flutter/material.dart';

import '../../const/theme.dart';
import '../../widget/password_form_field.dart';
import '../../widget/text_form_field.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Care Giver Admin Registration',
              style: AppTheme.lightTheme.textTheme.headline6,
            ),
            Column(
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    style: AppTheme.elevatedButtonStyle(context),
                    onPressed: () {},
                    icon: const Icon(Icons.login),
                    label: const Text("Done"),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Already has an account?'),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Login",
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

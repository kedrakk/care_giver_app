import 'package:flutter/material.dart';

class PasswordFormFieldWidget extends StatefulWidget {
  const PasswordFormFieldWidget({
    Key? key,
    required this.obscureText,
    required this.controller,
    required this.focusNode,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    required this.onFieldSubmitted,
    required this.validator,
  }) : super(key: key);
  final bool obscureText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String labelText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;

  @override
  State<PasswordFormFieldWidget> createState() =>
      _PasswordFormFieldWidgetState();
}

class _PasswordFormFieldWidgetState extends State<PasswordFormFieldWidget> {
  bool _obscureText = true;

  @override
  void initState() {
    _getObscureData();
    super.initState();
  }

  _getObscureData() {
    setState(() {
      _obscureText = widget.obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: Theme.of(context).textTheme.bodyText1,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).cardColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        suffixIcon: IconButton(
          icon: _obscureText
              ? const Icon(Icons.visibility)
              : const Icon(Icons.visibility_off),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
      onFieldSubmitted: widget.onFieldSubmitted,
      validator: widget.validator,
    );
  }
}

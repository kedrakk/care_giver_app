import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    required this.onFieldSubmitted,
  }) : super(key: key);
  final TextEditingController controller;
  final FocusNode focusNode;
  final String labelText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        labelText: labelText,
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
      ),
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}

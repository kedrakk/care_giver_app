import 'package:flutter/material.dart';

import '../../const/theme.dart';
import '../../widget/text_form_field.dart';

class AddNewFeedPage extends StatelessWidget {
  AddNewFeedPage({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _instructionController = TextEditingController();
  final TextEditingController _cautionController = TextEditingController();
  final TextEditingController _photoPathController = TextEditingController();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _instructionFocus = FocusNode();
  final FocusNode _cautionFocus = FocusNode();
  final FocusNode _photoPathFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Adding a new feed',
          style: AppTheme.lightTheme.textTheme.bodyLarge,
        ),
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 30),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormFieldWidget(
                    controller: _nameController,
                    focusNode: _nameFocus,
                    textInputAction: TextInputAction.next,
                    labelText: 'Name',
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(_instructionFocus);
                    },
                    validator: (value) {
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormFieldWidget(
                    maxLines: 5,
                    minLines: 3,
                    controller: _instructionController,
                    focusNode: _instructionFocus,
                    textInputAction: TextInputAction.next,
                    labelText: 'Instruction',
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(_cautionFocus);
                    },
                    validator: (value) {
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormFieldWidget(
                    maxLines: 5,
                    minLines: 3,
                    controller: _cautionController,
                    focusNode: _cautionFocus,
                    textInputAction: TextInputAction.next,
                    labelText: "Caution",
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(_photoPathFocus);
                    },
                    validator: (value) {
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormFieldWidget(
                        controller: _photoPathController,
                        focusNode: _photoPathFocus,
                        labelText: "PhotoPath",
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).unfocus();
                        },
                        validator: (value) {
                          return null;
                        },
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        '* Please enter photo url only',
                        style: TextStyle(color: AppTheme.septenary),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    style: AppTheme.elevatedButtonStyle(context),
                    onPressed: () {},
                    icon: const Icon(Icons.save_as),
                    label: const Text("Save"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

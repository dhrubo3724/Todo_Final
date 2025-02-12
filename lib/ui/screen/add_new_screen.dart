import 'package:flutter/material.dart';

class AddNewScreen extends StatefulWidget {
  const AddNewScreen({super.key});

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();
  GlobalKey<FormState> _addfromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Todo"),
      ),
      body: Form(
        key: _addfromKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Enter your title';
                  }
                  return null;
                },
                controller: _titleTEController,
                decoration:
                    InputDecoration(labelText: 'Title', hintText: 'Title'),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                maxLength: 400,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Enter your description';
                  }
                  return null;
                },
                controller: _descriptionTEController,
                decoration: InputDecoration(
                    labelText: 'Description', hintText: 'Description'),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_addfromKey.currentState!.validate()) {
                      Navigator.pop(context);
                    }
                  },
                  child: Text("Add"))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleTEController.dispose();
    _descriptionTEController.dispose();
    super.dispose();
  }
}

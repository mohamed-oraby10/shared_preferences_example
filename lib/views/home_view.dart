import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preference_example/models/user_model.dart';
import 'package:shared_preference_example/widgets/text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String name = 'username';
  int age = 10;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(name, style: TextStyle(fontSize: 20)),
                Text(age.toString(), style: TextStyle(fontSize: 20)),
                SizedBox(height: 20),
                CustomTextField(
                  hintText: 'name',
                  onSaved: (value) {
                    name = value ?? '';
                  },
                ),
                SizedBox(height: 20),
                CustomTextField(
                  hintText: 'age',
                  onSaved: (value) {
                    age = int.parse(value!);
                  },
                ),
                SizedBox(height: 30),
                TextButton(
                  onPressed: () {
                    _saveData();
                  },
                  child: Text('Save data', style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      var value = sharedPreferences.getString('userModel');
      UserModel userModel = value == null
          ? UserModel()
          : UserModel.fromJson(json.decode(value));
      print(userModel.toJson());
    });
  }

  void _saveData() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString(
        'userModel',
        json.encode(UserModel(name: name, email: 'email', age: age).toJson()),
      );
      setState(() {});
    }
  }
}

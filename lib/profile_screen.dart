import 'package:flutter/material.dart';
import 'package:taptrend/utils/colorz.dart';
import 'package:taptrend/widget/textformfield.dart';
// import 'package:taptrend/widget/textformfield.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static const routeName = '/four';
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colorz.screenBackground,
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 75,
                ),
              ),
              SizedBox(height: 30,),
              CustomTextFormField(),
              CustomTextFormField(),
              CustomTextFormField(),
              CustomTextFormField(),
              CustomTextFormField(),
            ],
          ),
        ),
      ),
    );
  }
}
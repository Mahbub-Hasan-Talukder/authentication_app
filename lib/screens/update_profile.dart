import 'package:demo_ui/components/action_button.dart';
import 'package:demo_ui/components/birth_date_field_provider.dart';
import 'package:demo_ui/components/custom_textfields.dart';
import 'package:demo_ui/components/gender_field_provider.dart';
import 'package:demo_ui/components/profile_picture_holder.dart';
import 'package:demo_ui/components/title.dart';
import 'package:demo_ui/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class UpdateProfile extends StatelessWidget {
  UpdateProfile({super.key});
  final TextEditingController _date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const TitleText(text: "Update Profile"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: ProfilePictureHolder(image: Assets.profile.provider()),
              ),
              const CustomTextField(
                text: 'First Name',
                hintText: '',
              ),
              const SizedBox(height: 40),
              const CustomTextField(
                text: 'Last Name',
                hintText: '',
              ),
              const SizedBox(height: 40),
              const CustomTextField(
                text: 'Phone number',
                hintText: '',
              ),
              const SizedBox(height: 40),
              const GenderFieldProvider(),
              const SizedBox(height: 40),
              const DateOfBirthProvier(),
              const SizedBox(height: 40),
              const Spacer(),
              ActionButton(
                text: "Update profile",
                direction: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

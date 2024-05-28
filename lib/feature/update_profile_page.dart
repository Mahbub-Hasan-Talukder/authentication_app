
import 'package:authentication_app/core/gen/assets.gen.dart';
import 'package:authentication_app/core/service/navigation/routes/routes.dart';
import 'package:authentication_app/core/widgets/action_button.dart';
import 'package:authentication_app/core/service/api/endpoints.dart';
import 'package:authentication_app/core/widgets/birth_date_field_provider.dart';
import 'package:authentication_app/core/widgets/custom_textfields.dart';
import 'package:authentication_app/core/widgets/gender_field_provider.dart';
import 'package:authentication_app/core/widgets/profile_picture_holder.dart';
import 'package:authentication_app/core/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';

class UpdateProfile extends StatelessWidget {
  UpdateProfile({super.key});
  final TextEditingController _date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              // exit(0);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () async {
                  try {
                    Response response = await post(
                      Uri.parse(API.logout),
                    );
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        print(response.statusCode);
                        if (response.statusCode == 201) {
                          return AlertDialog(
                            title: const Text('Logout successful'),
                            content: const Text('Good Bye'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  GoRouter.of(context).pushNamed(Routes.login);
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        }
                        return AlertDialog(
                          title: const Text('Logout Failed'),
                          content: const Text('Try again'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  } catch (e) {
                    print(e.toString());
                  }
                },
                icon: const Icon(Icons.logout)),
          )
        ],
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
              CustomTextField(
                text: 'First Name',
                hintText: '',
              ),
              const SizedBox(height: 40),
              CustomTextField(
                text: 'Last Name',
                hintText: '',
              ),
              const SizedBox(height: 40),
              CustomTextField(
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

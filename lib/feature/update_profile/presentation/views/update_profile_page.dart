import 'package:authentication_app/core/gen/assets.gen.dart';
import 'package:authentication_app/core/service/navigation/routes/routes.dart';
import 'package:authentication_app/core/service/api/endpoints.dart';
import 'package:authentication_app/feature/update_profile/presentation/widgets/birth_date_field_provider.dart';
import 'package:authentication_app/feature/update_profile/presentation/widgets/gender_field_provider.dart';
import 'package:authentication_app/core/widgets/profile_picture_holder.dart';
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
        title: Text(
          "Update Profile",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: ProfilePictureHolder(image: Assets.images.profile.provider()),
              ),
              const SizedBox(height: 40),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'First Name',
                    style: TextStyle(
                        color: Color(0xFF24786D), fontWeight: FontWeight.w600),
                  ),
                  TextField(),
                ],
              ),
              const SizedBox(height: 40),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Last Name',
                    style: TextStyle(
                        color: Color(0xFF24786D), fontWeight: FontWeight.w600),
                  ),
                  TextField(),
                ],
              ),
              const SizedBox(height: 40),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Phone number',
                    style: TextStyle(
                        color: Color(0xFF24786D), fontWeight: FontWeight.w600),
                  ),
                  TextField(),
                ],
              ),
              const SizedBox(height: 40),
              const GenderFieldProvider(),
              const SizedBox(height: 40),
              const DateOfBirthProvier(),
              const SizedBox(height: 40),
              const Spacer(),
              // ActionButton(
              //   text: "Update profile",
              //   direction: '',
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:authentication_app/core/gen/assets.gen.dart';
import 'package:authentication_app/core/widgets/green_line.dart';
import 'package:authentication_app/core/widgets/profile_picture_holder.dart';
import 'package:authentication_app/feature/home/presentation/riverpod/home_controller.dart';
import 'package:authentication_app/feature/home/presentation/riverpod/logout_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool flag = true;

  @override
  void initState() {
    super.initState();
    Future(() {
      ref.read(homeControllerProvider.notifier).getProfileInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeControllerProvider);
    final logoutFlag = ref.watch(logoutControllerProvider);

    ref.listen(homeControllerProvider, (_, next) {
      if (next.value?.$1 != null) {
        setState(() {
          flag = false;
        });
      }
    });
    ref.listen(logoutControllerProvider, (_, next) {
      if (next.value?.$1 != null) {
        context.go('/');
      } else if (next.value?.$2 != null) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error! Bad request.'),
              content: const Text('Logout failed'),
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
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Text(
                  'Home Page',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const GreenLine(right: 25),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfilePictureHolder(image: Assets.images.profile.provider()),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (flag)
                      ? const CircularProgressIndicator()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Name: ${state.value?.$1?.firstName} ${state.value?.$1?.lastName}',
                            ),
                            Text(
                              'Email: ${state.value?.$1?.email}',
                            ),
                          ],
                        ),
                ],
              ),
              const Spacer(),
              TextButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Theme.of(context).colorScheme.primary.withOpacity(0.7),
                    ),
                    foregroundColor: WidgetStatePropertyAll(
                      Theme.of(context).colorScheme.surface,
                    )),
                onPressed: () {
                  ref.read(logoutControllerProvider.notifier).logout();
                },
                child: (logoutFlag.isLoading)
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text('Logout'),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

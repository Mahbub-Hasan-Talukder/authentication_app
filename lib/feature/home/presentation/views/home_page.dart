import 'package:authentication_app/core/gen/assets.gen.dart';
import 'package:authentication_app/core/service/navigation/routes/routes.dart';
import 'package:authentication_app/core/widgets/green_line.dart';
import 'package:authentication_app/core/widgets/profile_picture_holder.dart';
import 'package:authentication_app/feature/home/controller/home_controller.dart';
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
      ref.read(homeControllerProvider.notifier).getInfo();
    });
  }
 
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeControllerProvider);
    ref.listen(homeControllerProvider, (_, next) {
      if (!next.isLoading) {
        setState(() {
          flag = false;
        });
      }
    });
 
    return Scaffold(
      appBar: AppBar(
        title: Stack(
          children: [
            Text('Home',style: Theme.of(context).textTheme.titleMedium,),
            const Underline(right: 25),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfilePictureHolder(image: Assets.profile.provider()),
              const SizedBox(
                height: 20
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (flag)
                      ? const CircularProgressIndicator()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                                'Name: ${state.value?.getFirstName()} ${state.value?.getLastName()}'),
                            Text(
                              'Email: ${state.value?.getEmail()}',
                            ),
                            // 
                          ],
                        ),
                ],
              ),
              const Spacer(),

              // TextButton(onPressed: (){context.pushNamed(Routes.login);}, child: Text('Logout')),
            ],
          ),
        ),
      ),
    );
  }
}
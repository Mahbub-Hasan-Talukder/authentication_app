import 'package:demo_ui/core/service/navigation/router_config/router_config.dart';

import 'package:demo_ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme,
      // home: const Login(),
      routerConfig: MyRouterConfig().router,
      // routeInformationParser: MyRouterConfig().router.routeInformationParser,
      // routerDelegate: MyRouterConfig().router.routerDelegate,
    );
    // return NewLoginPage();
  }

}


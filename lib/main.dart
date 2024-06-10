import 'package:authentication_app/core/service/navigation/router_config/router_config.dart';
import 'package:authentication_app/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Authentication App',
      theme: ThemeClass.theme,
      routerConfig: MyRouterConfig.router,
    );
  }
}

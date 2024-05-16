import 'package:demo_ui/core/service/navigation/router_config/router_config.dart';
import 'package:demo_ui/theme/theme.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
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
  }

  // final GoRouter _router = GoRouter(
  //   initialLocation: "/login",
  //   routes: [
      
  //     GoRoute(
  //       path: "/login",
  //       builder: (context, state) =>  Login(),
  //     ),
  //     GoRoute(
  //       path: "/signup",
  //       builder: (context, state) => const Signup(),
  //     ),
  //     GoRoute(
  //       path: "/forgotPassword",
  //       builder: (context, state) => ForgotPassword(),
  //     ),
  //     GoRoute(
  //       path: "/emailConfirmation/:email/:previousPage",
  //       builder: (context, state) => EmailConfirmation(
  //         email:state.pathParameters["email"]!,
  //         previousPage: state.pathParameters["previousPage"]!,

  //       ),
  //     ),
  //     GoRoute(
  //       path: "/resetPassword/:email/:previousPage",
  //       builder: (context, state) =>  ResetPassword(
  //         email: state.pathParameters["email"]!,
  //         previousPage: state.pathParameters["previousPage"]!,
  //       ),
  //     ),
  //     GoRoute(
  //       path: "/changePassword",
  //       builder: (context, state) => const ChangePassword(),
  //     ),
  //     GoRoute(
  //       path: "/profile",
  //       builder: (context, state) => UpdateProfile(),
  //     ),
  //   ],
  // );

}


import 'package:demo_ui/screens/change_password.dart';
import 'package:demo_ui/screens/email_confirmation.dart';
import 'package:demo_ui/screens/forgot_password.dart';
import 'package:demo_ui/screens/reset_password.dart';
import 'package:demo_ui/screens/signin.dart';
import 'package:demo_ui/screens/signup.dart';
import 'package:demo_ui/screens/update_profile.dart';
import 'package:demo_ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme,
      // home: const Login(),
      routerConfig: _router,
    );
  }

  final GoRouter _router = GoRouter(
    initialLocation: "/login",
    routes: [
      
      GoRoute(
        path: "/login",
        builder: (context, state) =>  Login(),
      ),
      GoRoute(
        path: "/signup",
        builder: (context, state) => const Signup(),
      ),
      GoRoute(
        path: "/forgotPassword",
        builder: (context, state) => ForgotPassword(),
      ),
      GoRoute(
        path: "/emailConfirmation/:email/:previousPage",
        builder: (context, state) => EmailConfirmation(
          email:state.pathParameters["email"]!,
          previousPage: state.pathParameters["previousPage"]!,

        ),
      ),
      GoRoute(
        path: "/resetPassword/:email",
        builder: (context, state) =>  ResetPassword(
          email: state.pathParameters["email"]!,
        ),
      ),
      GoRoute(
        path: "/changePassword",
        builder: (context, state) => const ChangePassword(),
      ),
      GoRoute(
        path: "/profile",
        builder: (context, state) => UpdateProfile(),
      ),
    ],
  );
}

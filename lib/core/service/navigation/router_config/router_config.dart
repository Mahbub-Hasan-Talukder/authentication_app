import 'package:authentication_app/core/service/navigation/routes/routes.dart';
import 'package:authentication_app/feature/email_confirmation/presentation/pages/email_confirmation_page.dart';
import 'package:authentication_app/feature/forgot_password/presentation/pages/forgot_password_page.dart';
import 'package:authentication_app/feature/home/presentation/pages/home_page.dart';
import 'package:authentication_app/feature/login/presentation/pages/login_page.dart';
import 'package:authentication_app/feature/reset_password/presentation/pages/reset_password_page.dart';
import 'package:authentication_app/feature/reset_password/presentation/pages/reset_password_page.dart';
import 'package:authentication_app/feature/signup/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyRouterConfig {
  static GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: Routes.login,
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(child: Login());
        },
      ),
      GoRoute(
        name: Routes.forgetPassword,
        path: '/forgetPassword',
        pageBuilder: (context, state) {
          return const MaterialPage(child: ForgotPassword());
        },
      ),
      GoRoute(
        name: Routes.emailConfirmation,
        path: '/emailConfirmation/:email/:previousPage',
        pageBuilder: (context, state) {
          return MaterialPage(
            child: EmailConfirmation(
              email: state.pathParameters['email']!,
              previousPage: state.pathParameters['previousPage']!,
            ),
          );
        },
      ),
      GoRoute(
        name: Routes.signup,
        path: '/signup',
        pageBuilder: (context, state) {
          return const MaterialPage(child: SignUp());
        },
      ),
      GoRoute(
        name: Routes.resetPass,
        path: '/resetPassword/:email',
        pageBuilder: (context, state) {
          return MaterialPage(
            child: ResetPass(email: state.pathParameters['email']!),
            child: ResetPass(email: state.pathParameters['email']!),
          );
        },
      ),
      GoRoute(
        name: Routes.home,
        path: '/home',
        pageBuilder: (context, state) {
          return const MaterialPage(child: HomePage());
        },
      ),
    ],
    redirect: (context, state) async {
      final prefs = await SharedPreferences.getInstance();
      final email = prefs.getString('loggedInEmail');
      final isLoggedIn = (email != null);

      if (isLoggedIn && state.fullPath == '/') {
        return '/home';
      } else if (!isLoggedIn && state.fullPath == '/') {
        return '/';
      }
      return null;
    },
  );
}

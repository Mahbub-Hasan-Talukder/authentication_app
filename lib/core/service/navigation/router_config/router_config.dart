import 'package:authentication_app/core/service/navigation/routes/routes.dart';
import 'package:authentication_app/feature/email_confirmation/presentation/views/email_confirmation_page.dart';
import 'package:authentication_app/feature/forgot_password/presentation/views/forgot_password_page.dart';
import 'package:authentication_app/feature/home/presentation/views/home_page.dart';
import 'package:authentication_app/feature/reset_password/presentation/views/reset_password_page.dart';
import 'package:authentication_app/feature/signup/presentation/views/signup_page.dart';
import 'package:authentication_app/feature/update_profile/presentation/views/update_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
          return const MaterialPage(child: Signup());
        },
      ),
      GoRoute(
        name: Routes.profile,
        path: '/profile',
        pageBuilder: (context, state) {
          return MaterialPage(child: UpdateProfile());
        },
      ),
      GoRoute(
        name: Routes.resetPassword,
        path: '/resetPassword/:email',
        pageBuilder: (context, state) {
          return MaterialPage(
            child: ResetPassword(email: state.pathParameters['email']!),
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
  );
}

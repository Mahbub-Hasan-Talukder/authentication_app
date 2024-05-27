import 'package:authentication_app/core/service/navigation/routes/routes.dart';
import 'package:authentication_app/feature/email_confirmation_page.dart';
import 'package:authentication_app/feature/forgot_password_page.dart';
import 'package:authentication_app/feature/reset_password_page.dart';
import 'package:authentication_app/feature/signin_page.dart';
import 'package:authentication_app/feature/signup_page.dart';
import 'package:authentication_app/feature/update_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyRouterConfig {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: Routes.login,
        path: '/',
        pageBuilder: (contexct, state) {
          return MaterialPage(child: Login());
        },
      ),
      GoRoute(
        name: Routes.forgetPassword,
        path: '/forgetPassword',
        pageBuilder: (contexct, state) {
          return MaterialPage(child: ForgotPassword());
        },
       
      ),
      GoRoute(
        name: Routes.emailConfirmation,
        path: '/emailConfirmation/:email/:previousPage',
        pageBuilder: (contexct, state) {
          return MaterialPage(
              child: EmailConfirmation(
            email: state.pathParameters['email']!,
            previousPage: state.pathParameters['previousPage']!,
          ));
        },
      ),
      GoRoute(
        name: Routes.signup,
        path: '/signup',
        pageBuilder: (contexct, state) {
          return MaterialPage(child: Signup());
        },
      ),
      GoRoute(
        name: Routes.profile,
        path: '/profile',
        pageBuilder: (contexct, state) {
          return MaterialPage(child: UpdateProfile());
        },
      ),
      GoRoute( 
        name: Routes.resetPassword,
        path: '/resetPassword/:email',
        pageBuilder: (contexct, state) {
          return MaterialPage(
              child: ResetPassword(email: state.pathParameters['email']!));
        },
      )
    ],
  );
}

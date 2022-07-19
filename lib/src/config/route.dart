import 'package:flutter/material.dart';
import 'package:our_auth/src/bloc/app_bloc.dart';
import 'package:our_auth/src/screens/auth/login_screen.dart';
import 'package:our_auth/src/screens/home_screen.dart';

List<Page> onGenerateAppViewPages(
    UserLoginStatus userLoginStatus, List<Page<dynamic>> pages) {
  switch (userLoginStatus) {
    case UserLoginStatus.authenticated:
      return [const MaterialPage<void>(child: HomeScreen())];
    case UserLoginStatus.unauthenticated:
      return [const MaterialPage<void>(child: LoginScreen())];
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_auth/bloc_observer.dart';
import 'package:our_auth/src/config/route.dart';

Future<void> main() {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      runApp(const MyApp());
    },
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppView();
  }
}

class AppView extends StatelessWidget {
  AppView({Key? key}) : super(key: key);
  final AppRoute _appRoute = AppRoute();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _appRoute.onGeneratedRoute,
    );
  }
}

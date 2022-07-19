import 'package:firebase_core/firebase_core.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_auth/bloc_observer.dart';
import 'package:our_auth/src/bloc/app_bloc.dart';
import 'package:our_auth/src/config/route.dart';
import 'package:our_auth/src/repositories/auth_repository.dart';

Future<void> main() {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      final authRepository = AuthRepository();
      runApp(MyApp(authRepository: authRepository));
    },
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final AuthRepository _authRepository;

  const MyApp({Key? key, required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepository,
      child: BlocProvider(
        create: (_) => AppBloc(
          authRepository: _authRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FlowBuilder(
        state: context.select((AppBloc bloc) => bloc.state.userLoginStatus),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}

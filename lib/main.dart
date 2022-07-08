import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:xtrip_mobile/navigators/app_navigator.dart';
import 'package:xtrip_mobile/repositories/auth_repository.dart';
import 'package:xtrip_mobile/repositories/user_repository.dart';
import 'package:xtrip_mobile/sessions/session_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:xtrip_mobile/simple_bloc_observer.dart';

Future main() async {
  await runZonedGuarded(() async {
    await dotenv.load(fileName: '.env');
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    // runApp(const MyApp());
    BlocOverrides.runZoned(
      () => runApp(MyApp()),
      blocObserver: SimpleBlocObserver(),
    );
  }, (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => AuthRepository()),
          RepositoryProvider(create: (context) => UserRepository()),
        ],
        child: BlocProvider(
          create: (context) => SessionCubit(
              authRepo: context.read<AuthRepository>(),
              userRepo: context.read<UserRepository>()),
          child: const AppNavigator(),
        ),
      ),
    );
  }
}

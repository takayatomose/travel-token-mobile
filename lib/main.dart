import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:xtrip_mobile/navigators/app_navigator.dart';
import 'package:xtrip_mobile/repositories/auth_repository.dart';
// import 'package:xtrip_mobile/screens/forgot_password_screen.dart';
// import 'package:xtrip_mobile/screens/siginin_screen.dart';
// import 'package:xtrip_mobile/screens/signup_screen.dart';
// import 'package:xtrip_mobile/screens/splash_screen.dart';
import 'package:xtrip_mobile/sessions/session_cubit.dart';


Future main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RepositoryProvider(
        create: (context) => AuthRepository(),
        child: BlocProvider(
          create: (context) =>
              SessionCubit(authRepo: context.read<AuthRepository>()),
          child: const AppNavigator(),
        ),
      ),
    );
  }
}

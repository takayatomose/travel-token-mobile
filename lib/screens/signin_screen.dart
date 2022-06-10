import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:xtrip_mobile/bloc/auth/signin/sigin_bloc.dart';
import 'package:xtrip_mobile/bloc/auth/signin/signin_event.dart';
import 'package:xtrip_mobile/bloc/auth/signin/signin_state.dart';
import 'package:xtrip_mobile/cubits/auth_cubit.dart';
import 'package:xtrip_mobile/repositories/auth_repository.dart';
import 'package:xtrip_mobile/widgets/border_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _signinFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SignInBloc(
            authRepo: context.read<AuthRepository>(),
            authCubit: context.read<AuthCubit>()),
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 65),
            child: BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) => Form(
                key: _signinFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Welcome back!',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 27),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: Text(
                        'Login to your account to keep traveling',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // _emailField(),
                    BorderTextField(
                      padding: const EdgeInsets.only(bottom: 10),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      hintText: 'Your email',
                      icon: Icons.email,
                      onChanged: (value) => context
                          .read<SignInBloc>()
                          .add(SignInEmailChanged(email: value)),
                    ),
                    BorderTextField(
                      padding: const EdgeInsets.only(bottom: 10),
                      hintText: 'Your password',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      icon: Icons.key,
                      onChanged: (value) => context
                          .read<SignInBloc>()
                          .add(SignInPasswordChanged(password: value)),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 20),
                      alignment: Alignment.topRight,
                      child: InkWell(
                        child: const Text(
                          'Forgot password?',
                          textAlign: TextAlign.right,
                        ),
                        onTap: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 60)),
                          onPressed: () {},
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w300),
                          )),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Text('Or connect using'),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 25),
                              child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 12)),
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.facebook_sharp,
                                    size: 27,
                                  ),
                                  label: const Text(
                                    'Facebook',
                                    style: TextStyle(fontSize: 18),
                                  )),
                            ),
                            ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 12)),
                                onPressed: () {},
                                icon: const Icon(
                                  MdiIcons.google,
                                  size: 27,
                                ),
                                label: const Text('Google',
                                    style: TextStyle(fontSize: 18))),
                          ]),
                    ),
                    RichText(
                        text: TextSpan(
                            text: 'Don\'t have account? ',
                            style: const TextStyle(color: Colors.black),
                            children: [
                          TextSpan(
                              text: 'Sign up',
                              style: const TextStyle(
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()..onTap = () {})
                        ]))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _emailField() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.email),
            hintText: 'Input your email address',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
      ),
    );
  }
}

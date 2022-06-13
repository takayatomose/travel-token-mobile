import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/login_1.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocProvider(
          create: (context) => SignInBloc(
              authRepo: context.read<AuthRepository>(),
              authCubit: context.read<AuthCubit>()),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 40),
                        padding:
                            const EdgeInsets.only(top: 30, left: 20, right: 20),
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.1, 0.1),
                                  blurRadius: 2.0)
                            ],
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white),
                        child: BlocBuilder<SignInBloc, SignInState>(
                          builder: (context, state) => Form(
                            key: _signinFormKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    'Login',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 40),
                                  child: Text(
                                    'Login to your account to keep traveling',
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                BorderTextField(
                                  padding: const EdgeInsets.only(bottom: 30),
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
                                  padding: const EdgeInsets.only(bottom: 15),
                                  hintText: 'Your password',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    return null;
                                  },
                                  icon: Icons.lock,
                                  onChanged: (value) => context
                                      .read<SignInBloc>()
                                      .add(SignInPasswordChanged(
                                          password: value)),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(bottom: 60),
                                  alignment: Alignment.topRight,
                                  child: InkWell(
                                    child: const Text(
                                      'Forgot password',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: 14,
                                          color:
                                              Color.fromRGBO(255, 128, 8, 1)),
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: const Color.fromRGBO(255, 128, 8, 1),
                                shape: const CircleBorder(
                                    side: BorderSide(
                                        width: 8, color: Colors.white)),
                                padding: const EdgeInsets.all(25)),
                            onPressed: () {},
                            child: const Icon(
                              Icons.east,
                              size: 30,
                            )),
                      )
                    ],
                  ),
                ],
              ),
              Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'Don\'t have account? ',
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(0, 0, 0, 0.5)),
                        children: [
                          TextSpan(
                            text: 'Sign up',
                            style: const TextStyle(
                                color: Color.fromRGBO(255, 128, 8, 1),
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.read<AuthCubit>().showSignUp();
                              },
                          )
                        ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}

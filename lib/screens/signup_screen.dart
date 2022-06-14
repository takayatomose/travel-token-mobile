import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/bloc/auth/sign_up/signup_bloc.dart';
import 'package:xtrip_mobile/bloc/auth/sign_up/signup_event.dart';
import 'package:xtrip_mobile/bloc/auth/sign_up/signup_state.dart';
import 'package:xtrip_mobile/cubits/auth_cubit.dart';
import 'package:xtrip_mobile/repositories/auth_repository.dart';
import 'package:xtrip_mobile/widgets/border_text_field.dart';
import 'package:xtrip_mobile/widgets/card_shadow.dart';
import 'package:xtrip_mobile/widgets/circle_next_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreen createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  final GlobalKey<FormState> _signupFormKey = GlobalKey<FormState>();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/signup_1.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: BlocProvider(
          create: (context) => SignUpBloc(
              authRepo: context.read<AuthRepository>(),
              authCubit: context.read<AuthCubit>()),
          child: Stack(
            children: [
              BlocListener<SignUpBloc, SignUpState>(
                listener: (context, state) {},
                child: BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) => Form(
                    key: _signupFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            CardShadow(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _headerText(),
                                  _secondHeaderText(),
                                  BorderTextField(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    hintText: 'Your full name',
                                    icon: Icons.person,
                                    requiredField: true,
                                    requiredMessage: 'Please enter your name',
                                    onChanged: (value) => context
                                        .read<SignUpBloc>()
                                        .add(SignUpFullNameChanged(
                                            fullName: value)),
                                  ),
                                  BorderTextField(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    hintText: 'Your email address',
                                    requiredField: true,
                                    requiredMessage:
                                        'Please enter your email address',
                                    icon: Icons.email,
                                    onChanged: (value) => context
                                        .read<SignUpBloc>()
                                        .add(SignUpEmailChanged(email: value)),
                                  ),
                                  BorderTextField(
                                    controller: password,
                                    padding: const EdgeInsets.only(bottom: 15),
                                    requiredField: true,
                                    requiredMessage:
                                        'Please enter your password',
                                    icon: Icons.key,
                                    hintText: 'Your password',
                                    obscureText: true,
                                    onChanged: (value) => context
                                        .read<SignUpBloc>()
                                        .add(SignUpPasswordChanged(
                                            password: value)),
                                  ),
                                  BorderTextField(
                                    controller: confirmPassword,
                                    padding: const EdgeInsets.only(bottom: 15),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please re-enter password';
                                      }
                                      if (password.text !=
                                          confirmPassword.text) {
                                        return 'Password does not match';
                                      }
                                      return null;
                                    },
                                    icon: Icons.key,
                                    hintText: 'Confirm your password',
                                    obscureText: true,
                                  ),
                                  BorderTextField(
                                    onChanged: (value) => context
                                        .read<SignUpBloc>()
                                        .add(SignUpInvitationChanged(
                                            invitationCode: value)),
                                    padding: const EdgeInsets.only(bottom: 20),
                                    requiredMessage:
                                        'Please enter your invitation code',
                                    requiredField: true,
                                    hintText: 'Invitation code',
                                    icon: Icons.discount,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 70, right: 30, left: 30),
                                    child: Center(
                                      child: RichText(
                                        softWrap: true,
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                            text:
                                                'By creating the account, you agree with our ',
                                            style: const TextStyle(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.5),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                            children: [
                                              TextSpan(
                                                  text: 'Terms and Conditions',
                                                  style: const TextStyle(
                                                      color: Color.fromRGBO(
                                                          255, 128, 8, 1),
                                                      decoration: TextDecoration
                                                          .underline),
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () {})
                                            ]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: CircleNextButton(
                                  onPressed: () {
                                    if (_signupFormKey.currentState!
                                        .validate()) {}
                                  },
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 50,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                          style: const TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                          text: 'Already had account? ',
                          children: [
                            TextSpan(
                                text: 'Login',
                                style: const TextStyle(
                                    color: Color.fromRGBO(255, 128, 8, 1),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    context.read<AuthCubit>().showSignIn();
                                  })
                          ]),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Padding _secondHeaderText() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: Text(
        'Create an account to get earning while traveling',
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 15),
      ),
    );
  }

  Padding _headerText() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Text(
        'SIGNUP',
        textAlign: TextAlign.left,
        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24),
      ),
    );
  }
}

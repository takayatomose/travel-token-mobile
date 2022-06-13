import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/bloc/auth/sign_up/signup_bloc.dart';
import 'package:xtrip_mobile/bloc/auth/sign_up/signup_event.dart';
import 'package:xtrip_mobile/bloc/auth/sign_up/signup_state.dart';
import 'package:xtrip_mobile/cubits/auth_cubit.dart';
import 'package:xtrip_mobile/repositories/auth_repository.dart';
import 'package:xtrip_mobile/widgets/border_text_field.dart';

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
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: BlocProvider(
          create: (context) => SignUpBloc(
              authRepo: context.read<AuthRepository>(),
              authCubit: context.read<AuthCubit>()),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Center(
                    child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
                  child: BlocListener<SignUpBloc, SignUpState>(
                    listener: (context, state) {},
                    child: BlocBuilder<SignUpBloc, SignUpState>(
                      builder: (context, state) => Form(
                        key: _signupFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _headerText(),
                            _secondHeaderText(),
                            BorderTextField(
                              padding: const EdgeInsets.only(bottom: 10),
                              hintText: 'Your full name',
                              icon: Icons.person,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                              onChanged: (value) => context
                                  .read<SignUpBloc>()
                                  .add(SignUpFullNameChanged(fullName: value)),
                            ),
                            BorderTextField(
                              padding: const EdgeInsets.only(bottom: 10),
                              hintText: 'Your email address',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                              icon: Icons.email,
                              onChanged: (value) => context
                                  .read<SignUpBloc>()
                                  .add(SignUpEmailChanged(email: value)),
                            ),
                            BorderTextField(
                              controller: password,
                              padding: const EdgeInsets.only(bottom: 10),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                              icon: Icons.key,
                              hintText: 'Your password',
                              obscureText: true,
                              onChanged: (value) => context
                                  .read<SignUpBloc>()
                                  .add(SignUpPasswordChanged(password: value)),
                            ),
                            BorderTextField(
                              controller: confirmPassword,
                              padding: const EdgeInsets.only(bottom: 30),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please re-enter password';
                                }
                                if (password.text != confirmPassword.text) {
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
                              padding: const EdgeInsets.only(bottom: 10),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your invitation code';
                                }
                                return null;
                              },
                              hintText: 'Invitation code',
                              icon: Icons.discount,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 60),
                                    primary:
                                        const Color.fromRGBO(46, 46, 46, 1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onPressed: () {
                                  if (_signupFormKey.currentState!.validate()) {
                                    context
                                        .read<SignUpBloc>()
                                        .add(SignUpSubmitted());
                                  }
                                },
                                child: const Text(
                                  'Create',
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 50),
                              child: Center(
                                child: RichText(
                                  softWrap: true,
                                  textAlign: TextAlign.justify,
                                  text: TextSpan(
                                      text:
                                          'By creating the account, you agree with our ',
                                      style:
                                          const TextStyle(color: Colors.black),
                                      children: [
                                        TextSpan(
                                            text: 'Terms and Conditions',
                                            style: const TextStyle(
                                                decoration:
                                                    TextDecoration.underline),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {})
                                      ]),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text('Already had account?'),
                            ),
                            ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 25),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                ),
                                child: const Text(
                                  'Login with us',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding _secondHeaderText() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 40),
      child: Text(
        'Create an account to get earning while traveling',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15),
      ),
    );
  }

  Padding _headerText() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 17),
      child: Text(
        'SIGNUP',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 27),
      ),
    );
  }
}

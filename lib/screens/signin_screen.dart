import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/bloc/auth/signin/sigin_bloc.dart';
import 'package:xtrip_mobile/bloc/auth/signin/signin_event.dart';
import 'package:xtrip_mobile/bloc/auth/signin/signin_state.dart';
import 'package:xtrip_mobile/cubits/auth_cubit.dart';
import 'package:xtrip_mobile/repositories/auth_repository.dart';
import 'package:xtrip_mobile/sessions/form_submission_status.dart';
import 'package:xtrip_mobile/widgets/border_text_field.dart';
import 'package:xtrip_mobile/widgets/card_shadow.dart';
import 'package:xtrip_mobile/widgets/circle_next_button.dart';
import 'package:xtrip_mobile/widgets/container_background.dart';
import 'package:xtrip_mobile/widgets/loading_indicator.dart';

import '../widgets/overlay_container.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _signinFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ContainerBackground(
      bgAsset: 'assets/images/login_1.png',
      child: BlocProvider(
        create: (context) => SignInBloc(
            authRepo: context.read<AuthRepository>(),
            authCubit: context.read<AuthCubit>()),
        child: BlocConsumer<SignInBloc, SignInState>(
          listener: (context, state) {},
          builder: (context, state) => Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        CardShadow(
                          child: Form(
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
                                  requiredField: true,
                                  requiredMessage: 'Please enter your email',
                                  hintText: 'Your email',
                                  icon: Icons.email,
                                  onChanged: (value) => context
                                      .read<SignInBloc>()
                                      .add(SignInEmailChanged(email: value)),
                                ),
                                BorderTextField(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  hintText: 'Your password',
                                  requiredField: true,
                                  requiredMessage: 'Please enter your password',
                                  icon: Icons.lock,
                                  obscureText: true,
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
                                    onTap: () {
                                      context
                                          .read<AuthCubit>()
                                          .showForgotPassword();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: CircleNextButton(onPressed: () {
                            context.read<SignInBloc>().add(SignInSubmitted());
                          }),
                        )
                      ],
                    ),
                  ],
                ),
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
              ),
              _showDialog(context, state),
            ],
          ),
        ),
      ),
    );
  }

  Widget _showDialog(BuildContext context, SignInState state) {
    FormSubmissionStatus formStatus = state.formStatus;
    if (formStatus is FormSubmitting) {
      return const LoadingIndicator();
    } else if (formStatus is SubmissionFailed) {
      return OverlayContainer(
        child: AlertDialog(
          title: const Text('Login Failed'),
          content: const Text('Invalid email or password!'),
          actions: [
            TextButton(
                onPressed: () {
                  context.read<SignInBloc>().add(SignInAgain());
                },
                child: const Text('Ok'))
          ],
        ),
      );
    } else if (formStatus is SubmissionSuccess) {
      return OverlayContainer(
        child: AlertDialog(
          title: const Text('Login Succesfully'),
          content: const Text('You have login to your account successful'),
          actions: [
            TextButton(onPressed: () {}, child: const Text('Continue to app'))
          ],
        ),
      );
    }
    return Container();
  }
}

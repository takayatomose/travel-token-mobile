import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/bloc/auth/sign_up/signup_bloc.dart';
import 'package:xtrip_mobile/bloc/auth/sign_up/signup_event.dart';
import 'package:xtrip_mobile/bloc/auth/sign_up/signup_state.dart';
import 'package:xtrip_mobile/cubits/auth_cubit.dart';
import 'package:xtrip_mobile/generated/l10n.dart';
import 'package:xtrip_mobile/repositories/auth_repository.dart';
import 'package:xtrip_mobile/sessions/form_submission_status.dart';
import 'package:xtrip_mobile/widgets/border_text_field.dart';
import 'package:xtrip_mobile/widgets/card_shadow.dart';
import 'package:xtrip_mobile/widgets/circle_next_button.dart';
import 'package:xtrip_mobile/widgets/container_background.dart';
import 'package:xtrip_mobile/widgets/overlay_container.dart';

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
    double height = MediaQuery.of(context).size.height;
    return ContainerBackground(
      bgAsset: 'assets/images/auth_4.png',
      child: BlocProvider(
        create: (context) => SignUpBloc(
            authRepo: context.read<AuthRepository>(),
            authCubit: context.read<AuthCubit>()),
        child: BlocConsumer<SignUpBloc, SignUpState>(
          listener: (context, state) {},
          builder: (context, state) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(height: height),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
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
                                      padding:
                                          const EdgeInsets.only(bottom: 15),
                                      hintText: S.of(context).fullNameHint,
                                      icon: Icons.person,
                                      requiredField: true,
                                      requiredMessage:
                                          S.of(context).fullNameEmptyError,
                                      onChanged: (value) => context
                                          .read<SignUpBloc>()
                                          .add(SignUpFullNameChanged(
                                              fullName: value)),
                                    ),
                                    BorderTextField(
                                      padding:
                                          const EdgeInsets.only(bottom: 15),
                                      hintText: S.of(context).emailHint,
                                      requiredField: true,
                                      requiredMessage:
                                          S.of(context).emailEmptyError,
                                      icon: Icons.email,
                                      onChanged: (value) => context
                                          .read<SignUpBloc>()
                                          .add(
                                              SignUpEmailChanged(email: value)),
                                    ),
                                    BorderTextField(
                                      controller: password,
                                      padding:
                                          const EdgeInsets.only(bottom: 15),
                                      requiredField: true,
                                      requiredMessage:
                                          S.of(context).enterPassword,
                                      icon: Icons.lock,
                                      hintText: S.of(context).passwordHint,
                                      obscureText: true,
                                      onChanged: (value) => context
                                          .read<SignUpBloc>()
                                          .add(SignUpPasswordChanged(
                                              password: value)),
                                    ),
                                    BorderTextField(
                                      controller: confirmPassword,
                                      padding:
                                          const EdgeInsets.only(bottom: 15),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return S.of(context).pleaseEnterPwd;
                                        }
                                        if (password.text !=
                                            confirmPassword.text) {
                                          return S.of(context).pwdNotMatched;
                                        }
                                        return null;
                                      },
                                      icon: Icons.lock,
                                      hintText: S.of(context).confirmPwd,
                                      obscureText: true,
                                    ),
                                    BorderTextField(
                                      onChanged: (value) => context
                                          .read<SignUpBloc>()
                                          .add(SignUpInvitationChanged(
                                              invitationCode: value)),
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      requiredMessage:
                                          S.of(context).enterInvitationCode,
                                      requiredField: true,
                                      hintText: S.of(context).invitationCode,
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
                                            text: S
                                                .of(context)
                                                .agreedCreatingAccount,
                                            style: const TextStyle(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.5),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                            children: [
                                              TextSpan(
                                                  text: S
                                                      .of(context)
                                                      .termConditions,
                                                  style: const TextStyle(
                                                      color: Color.fromRGBO(
                                                          255, 128, 8, 1),
                                                      decoration: TextDecoration
                                                          .underline),
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () {})
                                            ],
                                          ),
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
                                        .validate()) {
                                      context
                                          .read<SignUpBloc>()
                                          .add(SignUpSubmitted());
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                        ],
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
                          text: '${S.of(context).alreadyHadAccount} ',
                          children: [
                            TextSpan(
                                text: S.of(context).login,
                                style: const TextStyle(
                                    color: Color.fromRGBO(255, 128, 8, 1),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    context.read<AuthCubit>().showSignIn();
                                  })
                          ],
                        ),
                      ),
                    ),
                  ),
                  _showDialog(context, state),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _showDialog(BuildContext context, SignUpState state) {
    FormSubmissionStatus formStatus = state.formStatus;

    if (formStatus is FormSubmitting) {
      return const OverlayContainer(
        child: Center(
            child: SizedBox(
          height: 100,
          width: 100,
          child: CircularProgressIndicator(),
        )),
      );
    } else if (formStatus is SubmissionFailed) {
      return OverlayContainer(
        child: AlertDialog(
          title: Text(S.of(context).signupFailed),
          content: Text(state.errorMessage),
          actions: [
            TextButton(
                onPressed: () {
                  context.read<SignUpBloc>().add(SignUpAgain());
                },
                child: Text(S.of(context).ok))
          ],
        ),
      );
    } else if (formStatus is SubmissionSuccess) {
      return OverlayContainer(
        child: AlertDialog(
          title: Text(S.of(context).createdAccount),
          content: Text(S.of(context).sentActivatedCode),
          actions: [
            TextButton(
                onPressed: () => {
                      context
                          .read<AuthCubit>()
                          .showActivation(email: state.email)
                    },
                child: Text(S.of(context).confirm))
          ],
        ),
      );
    }
    return Container();
  }

  Padding _secondHeaderText() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Text(
        S.of(context).creatingAccountToTravel,
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }

  Padding _headerText() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        S.of(context).signUp.toUpperCase(),
        textAlign: TextAlign.left,
        style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 24),
      ),
    );
  }
}

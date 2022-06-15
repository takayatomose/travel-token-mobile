import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/bloc/auth/forgot_passwd/forgot_passwd_bloc.dart';
import 'package:xtrip_mobile/bloc/auth/forgot_passwd/forgot_passwd_event.dart';
import 'package:xtrip_mobile/bloc/auth/forgot_passwd/forgot_passwd_state.dart';
import 'package:xtrip_mobile/cubits/auth_cubit.dart';
import 'package:xtrip_mobile/repositories/auth_repository.dart';
import 'package:xtrip_mobile/sessions/form_submission_status.dart';
import 'package:xtrip_mobile/widgets/border_text_field.dart';
import 'package:xtrip_mobile/widgets/card_shadow.dart';
import 'package:xtrip_mobile/widgets/circle_next_button.dart';
import 'package:xtrip_mobile/widgets/container_background.dart';
import 'package:xtrip_mobile/widgets/loading_indicator.dart';
import 'package:xtrip_mobile/widgets/overlay_container.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> _pwdFormKey = GlobalKey<FormState>();
  final TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ContainerBackground(
        bgAsset: 'assets/images/signup_1.png',
        child: BlocProvider(
          create: (context) => ForgotPwdBloc(
              authCubit: context.read<AuthCubit>(),
              authRepo: context.read<AuthRepository>()),
          child: BlocConsumer<ForgotPwdBloc, ForgotPwdState>(
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
                                key: _pwdFormKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        state.formState == PwdFormState.forgot
                                            ? 'FORGOT PASSWORD'
                                            : 'RESET PASSWORD',
                                        style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Text(state.formState ==
                                              PwdFormState.forgot
                                          ? 'Input your registered email address, we will send you the link to reset your password. Please check your email and follow instructions.'
                                          : 'Enter code that you received via email and your new password'),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 30),
                                      child: InkWell(
                                        child: const Text(
                                          'Need help?',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 128, 8, 1),
                                              decoration:
                                                  TextDecoration.underline),
                                        ),
                                        onTap: () {},
                                      ),
                                    ),
                                    if (state.formState == PwdFormState.forgot)
                                      BorderTextField(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        hintText: 'E-mail address',
                                        requiredField: true,
                                        requiredMessage:
                                            'Please enter your e-mail address',
                                        icon: Icons.email,
                                        onChanged: (value) => context
                                            .read<ForgotPwdBloc>()
                                            .add(ForgotPwdEmailChanged(
                                                email: value)),
                                      ),
                                    _codeField(context, state),
                                    _passwordField(context, state),
                                    _confirmPasswordField(context, state),
                                    const Padding(
                                        padding: EdgeInsets.only(bottom: 50)),
                                  ],
                                )),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              left: 0,
                              child: CircleNextButton(
                                onPressed: () {
                                  if (_pwdFormKey.currentState!.validate()) {
                                    if (state.formState ==
                                        PwdFormState.forgot) {
                                      context
                                          .read<ForgotPwdBloc>()
                                          .add(ForgotPwdSubmitted());
                                    } else {
                                      context
                                          .read<ForgotPwdBloc>()
                                          .add(ResetPwdSubmitted());
                                    }
                                  }
                                },
                              ))
                        ],
                      )
                    ],
                  ),
                ),
                _showDialog(context, state),
              ],
            ),
          ),
        ));
  }

  Widget _showDialog(BuildContext context, ForgotPwdState state) {
    FormSubmissionStatus formStatus = state.formStatus;
    if (formStatus is FormSubmitting) {
      return const LoadingIndicator();
    } else if (formStatus is SubmissionFailed) {
      return OverlayContainer(
        child: AlertDialog(
          title: const Text('Error'),
          content: const Text('Error'),
          actions: [
            TextButton(
                onPressed: () {
                  context.read<ForgotPwdBloc>().add(ForgotPwdAgain());
                  // if (state.formState == PwdFormState.forgot) {
                  //   context.read<ForgotPwdBloc>().add(ForgotPwdFormStateChanged(
                  //       formState: PwdFormState.reset));
                  // } else {
                  //   context.read<AuthCubit>().showSignIn();
                  // }
                },
                child: const Text('Ok'))
          ],
        ),
      );
    } else if (formStatus is SubmissionSuccess) {
      String title = state.formState == PwdFormState.forgot
          ? 'Forgot Password Success'
          : 'Reset Password Success';
      String content = state.formState == PwdFormState.forgot
          ? 'We sent you and an e-mail to instruction to reset password'
          : 'Your new password has been save! You can login now!';
      return OverlayContainer(
        child: AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
                onPressed: () {
                  if (state.formState == PwdFormState.forgot) {
                    context.read<ForgotPwdBloc>().add(ForgotPwdFormStateChanged(
                        formState: PwdFormState.reset));
                  } else {
                    context.read<AuthCubit>().showSignIn();
                  }
                },
                child: const Text('Confirm')),
          ],
        ),
      );
    }
    return Container();
  }

  Widget _codeField(BuildContext context, ForgotPwdState state) {
    if (state.formState == PwdFormState.forgot) {
      return Container();
    }
    return BorderTextField(
      padding: const EdgeInsets.only(bottom: 10),
      hintText: 'Your recover code',
      requiredField: true,
      requiredMessage: 'Please your recover code',
      onChanged: (value) =>
          context.read<ForgotPwdBloc>().add(ForgotPwdCodeChanged(code: value)),
      icon: Icons.code,
    );
  }

  Widget _passwordField(BuildContext context, ForgotPwdState state) {
    if (state.formState == PwdFormState.forgot) {
      return Container();
    }
    return BorderTextField(
      padding: const EdgeInsets.only(bottom: 10),
      controller: passwordCtrl,
      hintText: 'Your new password',
      requiredField: true,
      requiredMessage: 'Please your new password',
      obscureText: true,
      onChanged: (value) => context
          .read<ForgotPwdBloc>()
          .add(ForgotPwdPasswordChanged(password: value)),
      icon: Icons.lock,
    );
  }

  Widget _confirmPasswordField(BuildContext context, ForgotPwdState state) {
    if (state.formState == PwdFormState.forgot) {
      return Container();
    }
    return BorderTextField(
      padding: const EdgeInsets.only(bottom: 10),
      hintText: 'Confirm your new password',
      obscureText: true,
      onChanged: (value) => context
          .read<ForgotPwdBloc>()
          .add(ForgotPwdPasswordChanged(password: value)),
      icon: Icons.lock,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please re-enter password';
        }
        if (passwordCtrl.text != value) {
          return 'Password does not match';
        }
        return null;
      },
    );
  }
}

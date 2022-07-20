import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/bloc/auth/forgot_passwd/forgot_passwd_bloc.dart';
import 'package:xtrip_mobile/bloc/auth/forgot_passwd/forgot_passwd_event.dart';
import 'package:xtrip_mobile/bloc/auth/forgot_passwd/forgot_passwd_state.dart';
import 'package:xtrip_mobile/cubits/auth_cubit.dart';
import 'package:xtrip_mobile/generated/l10n.dart';
import 'package:xtrip_mobile/repositories/auth_repository.dart';
import 'package:xtrip_mobile/sessions/form_submission_status.dart';
import 'package:xtrip_mobile/widgets/border_text_field.dart';
import 'package:xtrip_mobile/widgets/card_shadow.dart';
import 'package:xtrip_mobile/widgets/circle_next_button.dart';
import 'package:xtrip_mobile/widgets/container_background.dart';
import 'package:xtrip_mobile/widgets/loading_indicator.dart';
import 'package:xtrip_mobile/widgets/overlay_container.dart';
import 'package:xtrip_mobile/widgets/back_button.dart';

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
        bgAsset: 'assets/images/auth_2.png',
        child: BlocProvider(
          create: (context) => ForgotPwdBloc(
              authCubit: context.read<AuthCubit>(),
              authRepo: context.read<AuthRepository>()),
          child: BlocConsumer<ForgotPwdBloc, ForgotPwdState>(
            listener: (context, state) {},
            builder: (context, state) => Stack(
              children: [
                BackButtonCustom(onPressed: () {
                  context.read<AuthCubit>().showSignIn();
                }),
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
                                            ? S.of(context).forgotPassword
                                            : S.of(context).resetPassword,
                                        style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                          state.formState == PwdFormState.forgot
                                              ? S
                                                  .of(context)
                                                  .forgotPasswordInstruction
                                              : S
                                                  .of(context)
                                                  .enterResetPasswordCode),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 30),
                                      child: InkWell(
                                        child: Text(
                                          S.of(context).needHelp,
                                          style: const TextStyle(
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
                                        hintText: S.of(context).emailAddress,
                                        requiredField: true,
                                        requiredMessage:
                                            S.of(context).emailEmptyError,
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
          title: Text(S.of(context).error),
          content: Text(S.of(context).error),
          actions: [
            TextButton(
                onPressed: () {
                  context.read<ForgotPwdBloc>().add(ForgotPwdAgain());
                },
                child: Text(S.of(context).ok))
          ],
        ),
      );
    } else if (formStatus is SubmissionSuccess) {
      String title = state.formState == PwdFormState.forgot
          ? S.of(context).forgotPwdSuccess
          : S.of(context).resetPasswordSuccess;
      String content = state.formState == PwdFormState.forgot
          ? S.of(context).sentEmailPwdInstruction
          : S.of(context).resetPwdSuccessMsg;
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
                child: Text(S.of(context).confirm)),
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
      hintText: S.of(context).yourRecoverCode,
      requiredField: true,
      requiredMessage: S.of(context).pleaseEnterRecovercode,
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
      hintText: S.of(context).newPassword,
      requiredField: true,
      requiredMessage: S.of(context).pleseNewPassword,
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
      hintText: S.of(context).confirmNewPassword,
      obscureText: true,
      onChanged: (value) => context
          .read<ForgotPwdBloc>()
          .add(ForgotPwdPasswordChanged(password: value)),
      icon: Icons.lock,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).pleaseEnterPwd;
        }
        if (passwordCtrl.text != value) {
          return S.of(context).pwdNotMatched;
        }
        return null;
      },
    );
  }
}

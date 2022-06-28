import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/bloc/user_setting/change_password/change_password_bloc.dart';
import 'package:xtrip_mobile/bloc/user_setting/change_password/change_password_event.dart';
import 'package:xtrip_mobile/bloc/user_setting/change_password/change_password_state.dart';
import 'package:xtrip_mobile/repositories/user_repository.dart';
import 'package:xtrip_mobile/sessions/form_submission_status.dart';
import 'package:xtrip_mobile/sessions/session_cubit.dart';
import 'package:xtrip_mobile/utils/toast_notification.dart';
import 'package:xtrip_mobile/widgets/border_text_field.dart';
import 'package:xtrip_mobile/widgets/form_label.dart';
import 'package:xtrip_mobile/widgets/loading_indicator.dart';
import 'package:xtrip_mobile/widgets/user_setting_wrapper.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final GlobalKey<FormState> _changePwdFormKey = GlobalKey<FormState>();

  final TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext buildContext) {
    return BlocProvider(
      create: (context) => ChangePasswordBloc(
        sessionCubit: context.read<SessionCubit>(),
        userRepo: context.read<UserRepository>(),
      ),
      child: BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
        listener: (context, state) {
          final FormSubmissionStatus formStatus = state.formStatus;
          if (formStatus is SubmissionSuccess) {
            ToastNotification.showToast(context,
                type: 'success',
                message: 'Your password has been updated',
                title: 'Password Changed!');
          }
        },
        builder: (context, state) {
          return UserSettingWrapper(
            title: 'Change password',
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      elevation: 2,
                      margin: const EdgeInsets.only(
                          top: 30, right: 20, left: 20, bottom: 60),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 30),
                        child: Form(
                            key: _changePwdFormKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const FormLabel(text: 'Your current password'),
                                BorderTextField(
                                  hasIcon: false,
                                  padding: const EdgeInsets.only(bottom: 30),
                                  borderRadius: 8,
                                  requiredField: true,
                                  requiredMessage:
                                      'Please enter your current password',
                                  onChanged: (value) {
                                    context.read<ChangePasswordBloc>().add(
                                        ChangePasswordCurrentChanged(
                                            currentPassword: value));
                                  },
                                  obscureText: true,
                                ),
                                const FormLabel(text: 'Your new password'),
                                BorderTextField(
                                  padding: const EdgeInsets.only(bottom: 30),
                                  hasIcon: false,
                                  borderRadius: 8,
                                  requiredField: true,
                                  requiredMessage:
                                      'Please enter your new password',
                                  onChanged: (value) {
                                    context.read<ChangePasswordBloc>().add(
                                        ChangePasswordNewChanged(
                                            newPassword: value));
                                  },
                                  controller: passwordCtrl,
                                  obscureText: true,
                                ),
                                const FormLabel(text: 'Confirm password'),
                                BorderTextField(
                                  obscureText: true,
                                  padding: const EdgeInsets.only(bottom: 30),
                                  hasIcon: false,
                                  borderRadius: 8,
                                  requiredField: true,
                                  requiredMessage:
                                      'Please enter your new password',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please re-enter password';
                                    }
                                    if (passwordCtrl.text != value) {
                                      return 'Password does not match';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            )),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(255, 128, 8, 1),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15)),
                      onPressed: () {
                        if (_changePwdFormKey.currentState!.validate()) {
                          context
                              .read<ChangePasswordBloc>()
                              .add(ChangePasswordSubmitted());
                        }
                      },
                      child: const Text(
                        'Change your password',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                      ),
                    ),
                  ],
                ),
                _showDiglog(context, state),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _showDiglog(BuildContext context, ChangePasswordState state) {
    FormSubmissionStatus formStatus = state.formStatus;
    if (formStatus is FormSubmitting) {
      return const LoadingIndicator();
    }
    return Container();
  }
}

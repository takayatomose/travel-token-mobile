import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/bloc/user_setting/user_info/user_info_bloc.dart';
import 'package:xtrip_mobile/bloc/user_setting/user_info/user_info_event.dart';
import 'package:xtrip_mobile/bloc/user_setting/user_info/user_info_state.dart';
import 'package:xtrip_mobile/generated/l10n.dart';
import 'package:xtrip_mobile/repositories/user_repository.dart';
import 'package:xtrip_mobile/sessions/form_submission_status.dart';
import 'package:xtrip_mobile/sessions/session_cubit.dart';
import 'package:xtrip_mobile/sessions/session_state.dart';
import 'package:xtrip_mobile/utils/toast_notification.dart';
import 'package:xtrip_mobile/widgets/user_setting_wrapper.dart';

class AccountInfoScreen extends StatefulWidget {
  const AccountInfoScreen({Key? key}) : super(key: key);

  @override
  State<AccountInfoScreen> createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  late FocusNode fullNameFocus;

  @override
  void initState() {
    fullNameFocus = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext bContext) {
    final SessionState sessionState =
        BlocProvider.of<SessionCubit>(bContext).state;
    GlobalKey<FormState> infoFormKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => UserInfoBloc(
          fullName: sessionState.user!.fullName,
          sessionCubit: context.read<SessionCubit>(),
          userRepo: context.read<UserRepository>()),
      child: BlocConsumer<UserInfoBloc, UserInfoState>(
        listener: (context, state) {
          if (state.formStatus is SubmissionSuccess) {
            ToastNotification.showToast(context,
                type: 'success',
                title: S.of(context).userInfoUpdated,
                message: S.of(context).userInfoUpdatedMsg);
          }
          if (state.formStatus is SubmissionFailed) {
            ToastNotification.showToast(context,
                type: 'error',
                title: S.of(context).error,
                message: S.of(context).somethingWrong);
          }
        },
        builder: (context, state) {
          return UserSettingWrapper(
            title: S.of(context).yourAccount,
            child: Stack(children: [
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                margin: const EdgeInsets.only(top: 70, left: 20, right: 20),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          S.of(context).yourName,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(0, 0, 0, 0.5)),
                        ),
                        Expanded(
                          child: Form(
                            key: infoFormKey,
                            child: TextFormField(
                              focusNode: fullNameFocus,
                              enabled: state.editing,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              textAlign: TextAlign.end,
                              initialValue: sessionState.user.fullName,
                              onChanged: (value) => context
                                  .read<UserInfoBloc>()
                                  .add(
                                      UserInfoFullNameChanged(fullName: value)),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return S.of(context).fullNameEmptyError;
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: InkWell(
                            child: _submitIcon(state),
                            onTap: () {
                              if (!state.editing) {
                                context.read<UserInfoBloc>().add(
                                    UserInfoEditableChanged(editabled: true));
                                FocusScope.of(context)
                                    .requestFocus(fullNameFocus);
                              } else {
                                if (state.formStatus is FormSubmitting) {
                                } else if (infoFormKey.currentState!
                                    .validate()) {
                                  context
                                      .read<UserInfoBloc>()
                                      .add(UserInfoSubmitted());
                                }
                              }
                            },
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      child: Divider(
                          color: state.editing
                              ? Colors.black
                              : Colors.transparent),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).yourEmail,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(0, 0, 0, 0.5)),
                        ),
                        Text(
                          sessionState.user.email,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Color.fromRGBO(2, 33, 52, 1)),
                        )
                      ],
                    )
                  ]),
                ),
              ),
              Positioned(
                top: 20,
                left: 0,
                right: 0,
                child: Center(
                  child: Image(
                    width: 80,
                    height: 80,
                    image: AssetImage(
                        'assets/avatars/${sessionState.user!.profileAvatar}.png'),
                  ),
                ),
              ),
            ]),
          );
        },
      ),
    );
  }

  Icon _submitIcon(UserInfoState state) {
    final FormSubmissionStatus formStatus = state.formStatus;
    final bool editabled = state.editing;
    if (!editabled) {
      return const Icon(
        Icons.edit,
        size: 18,
      );
    } else {
      if (formStatus is FormSubmitting) {
        return const Icon(
          Icons.refresh,
          size: 18,
        );
      } else {
        return const Icon(
          Icons.check_circle,
          size: 18,
          color: Color.fromRGBO(6, 173, 44, 1),
        );
      }
    }
  }

  @override
  void dispose() {
    fullNameFocus.dispose();
    super.dispose();
  }
}

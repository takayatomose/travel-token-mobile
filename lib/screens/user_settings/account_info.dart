import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/bloc/user_setting/us_cubit.dart';
import 'package:xtrip_mobile/bloc/user_setting/user_info/user_info_bloc.dart';
import 'package:xtrip_mobile/bloc/user_setting/user_info/user_info_event.dart';
import 'package:xtrip_mobile/bloc/user_setting/user_info/user_info_state.dart';
import 'package:xtrip_mobile/repositories/user_repository.dart';
import 'package:xtrip_mobile/sessions/form_submission_status.dart';
import 'package:xtrip_mobile/sessions/session_cubit.dart';
import 'package:xtrip_mobile/sessions/session_state.dart';
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
  Widget build(BuildContext context) {
    final USCubit usCubit = BlocProvider.of<USCubit>(context);
    final SessionState sessionState =
        BlocProvider.of<SessionCubit>(context).state;
    GlobalKey<FormState> _infoFormKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => UserInfoBloc(
          fullName: sessionState.user!.fullName,
          sessionCubit: context.read<SessionCubit>(),
          userRepo: context.read<UserRepository>()),
      child: BlocConsumer<UserInfoBloc, UserInfoState>(
        listener: (context, state) {},
        builder: (context, state) {
          return UserSettingWrapper(
            title: 'Your account',
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
                        const Text(
                          'Your name',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(0, 0, 0, 0.5)),
                        ),
                        Expanded(
                          child: Form(
                            key: _infoFormKey,
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
                                  return 'Please enter your name';
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
                                } else if (_infoFormKey.currentState!
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
                        const Text(
                          'Your email',
                          style: TextStyle(
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
                  ))
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

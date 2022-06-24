import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/bloc/auth/user_activation/user_activation_bloc.dart';
import 'package:xtrip_mobile/bloc/auth/user_activation/user_activation_event.dart';
import 'package:xtrip_mobile/bloc/auth/user_activation/user_activation_state.dart';
import 'package:xtrip_mobile/cubits/auth_cubit.dart';
import 'package:xtrip_mobile/repositories/auth_repository.dart';
import 'package:xtrip_mobile/sessions/form_submission_status.dart';
import 'package:xtrip_mobile/widgets/border_text_field.dart';
import 'package:xtrip_mobile/widgets/card_shadow.dart';
import 'package:xtrip_mobile/widgets/circle_next_button.dart';
import 'package:xtrip_mobile/widgets/container_background.dart';
import 'package:xtrip_mobile/widgets/loading_indicator.dart';
import 'package:xtrip_mobile/widgets/overlay_container.dart';
import 'package:xtrip_mobile/widgets/back_button.dart';

class UserActiveScreen extends StatefulWidget {
  const UserActiveScreen({Key? key}) : super(key: key);

  @override
  State<UserActiveScreen> createState() => _UserActiveScreenState();
}

class _UserActiveScreenState extends State<UserActiveScreen> {
  final GlobalKey<FormState> _activeFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ContainerBackground(
      bgAsset: 'assets/images/auth_2.png',
      child: BlocProvider(
        create: (context) => UserActivationBloc(
            authRepo: context.read<AuthRepository>(),
            authCubit: context.read<AuthCubit>()),
        child: BlocConsumer<UserActivationBloc, UserActivationState>(
          builder: (context, state) => Stack(
            children: [
              BackButtonCustom(onPressed: () {
                context.read<AuthCubit>().showSignUp();
              }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _activeFormKey,
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
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    'VERIFICATION CODE',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 45),
                                  child: Text(
                                    'Please enter code sent to email',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                BorderTextField(
                                    requiredField: true,
                                    requiredMessage:
                                        'Please enter your verification code',
                                    hintText: 'Verification code',
                                    icon: Icons.copy_rounded,
                                    onChanged: (value) => context
                                        .read<UserActivationBloc>()
                                        .add(UserActivationCodeChange(
                                            activationCode: value)),
                                    padding: const EdgeInsets.only(bottom: 100))
                              ],
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: CircleNextButton(
                                onPressed: () {
                                  if (_activeFormKey.currentState!.validate()) {
                                    context
                                        .read<UserActivationBloc>()
                                        .add(UserActivationSubmitted());
                                  }
                                },
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              _showDialog(context, state),
            ],
          ),
          listener: (context, state) {},
        ),
      ),
    );
  }

  Widget _showDialog(BuildContext context, UserActivationState state) {
    FormSubmissionStatus formStatus = state.formStatus;

    if (formStatus is FormSubmitting) {
      return const LoadingIndicator();
    } else if (formStatus is SubmissionSuccess) {
      return OverlayContainer(
        child: AlertDialog(
          title: const Text('Account has been activated!'),
          content: const Text(
              'Your account has been activated successfully! You can signin to your account!'),
          actions: [
            TextButton(
                onPressed: () {
                  context.read<AuthCubit>().showSignIn();
                },
                child: const Text('Confirm'))
          ],
        ),
      );
    } else if (formStatus is SubmissionFailed) {
      return OverlayContainer(
        child: AlertDialog(
          title: const Text('Account activation failed'),
          content: const Text('Error'),
          actions: [
            TextButton(
                onPressed: () {
                  context.read<UserActivationBloc>().add(ActiveCodeAgain());
                },
                child: const Text('Ok'))
          ],
        ),
      );
    }
    return Container();
  }
}

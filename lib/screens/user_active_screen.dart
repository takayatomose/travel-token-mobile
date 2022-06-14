import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/bloc/auth/user_activation/user_activation_bloc.dart';
import 'package:xtrip_mobile/bloc/auth/user_activation/user_activation_event.dart';
import 'package:xtrip_mobile/bloc/auth/user_activation/user_activation_state.dart';
import 'package:xtrip_mobile/cubits/auth_cubit.dart';
import 'package:xtrip_mobile/repositories/auth_repository.dart';
import 'package:xtrip_mobile/widgets/border_text_field.dart';
import 'package:xtrip_mobile/widgets/card_shadow.dart';
import 'package:xtrip_mobile/widgets/circle_next_button.dart';
import 'package:xtrip_mobile/widgets/container_background.dart';

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
      bgAsset: 'assets/images/signup_1.png',
      child: BlocProvider(
        create: (context) => UserActivationBloc(
            authRepo: context.read<AuthRepository>(),
            authCubit: context.read<AuthCubit>()),
        child: BlocConsumer<UserActivationBloc, UserActivationState>(
          builder: (context, state) => Padding(
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
                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                'VERIFICATION CODE' + state.email,
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w700),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 45),
                              child: Text(
                                'Please enter code sent to email',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
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
                            onPressed: () {},
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
          listener: (context, state) {},
        ),
      ),
    );
  }
}

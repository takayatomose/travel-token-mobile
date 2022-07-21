import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/bloc/auth/authentication_bloc.dart';
import 'package:xtrip_mobile/cubits/auth_cubit.dart';
import 'package:xtrip_mobile/generated/l10n.dart';
import 'package:xtrip_mobile/repositories/auth_repository.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/onboard_1.webp'),
              fit: BoxFit.cover)),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: BlocProvider(
          create: ((context) => AuthenticationBloc(
              authRepo: context.read<AuthRepository>(),
              authCubit: context.read<AuthCubit>())),
          child: Center(
            child: Stack(
              children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16, top: 73),
                      child: Text(
                        S.of(context).travelToEarn,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 11),
                      child: Text(
                        S.of(context).alreadyHadAccount,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(0, 0, 0, 0.5)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 65),
                      child: InkWell(
                        onTap: () {
                          context.read<AuthCubit>().showSignIn();
                        },
                        child: Text(
                          S.of(context).loginWithUs,
                          style: const TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(255, 128, 8, 1)),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<AuthCubit>().showSignUp();
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 50),
                          primary: const Color.fromRGBO(255, 128, 8, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: Text(
                        S.of(context).getStarted,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
                Positioned(
                  bottom: 35,
                  right: 0,
                  left: 0,
                  child: Text(
                    S.of(context).copyright,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(234, 231, 231, 0.7)),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

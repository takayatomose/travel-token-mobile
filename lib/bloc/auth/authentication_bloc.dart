import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/cubits/auth_cubit.dart';
import 'package:xtrip_mobile/repositories/auth_repository.dart';

class AuthenticationBloc extends Bloc {
  final AuthRepository authRepo;
  final AuthCubit authCubit;

  AuthenticationBloc({required this.authRepo, required this.authCubit})
      : super({});
}

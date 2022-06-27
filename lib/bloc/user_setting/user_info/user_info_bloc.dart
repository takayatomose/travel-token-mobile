import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/bloc/user_setting/user_info/user_info_event.dart';
import 'package:xtrip_mobile/bloc/user_setting/user_info/user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  UserInfoBloc() : super(UserInfoState()) {}
}

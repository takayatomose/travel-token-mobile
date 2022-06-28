import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/bloc/user_setting/us_state.dart';

class USCubit extends Cubit<USState> {
  USCubit() : super(USSettingState());
  void accountInfo() {
    emit(USInfoState());
  }

  void changePassword() {
    emit(USPasswordState());
  }

  void userSetting() {
    emit(USSettingState());
  }

  void tos() {
    emit(USTosState());
  }

  void contactUs() {
    emit(USContactState());
  }

  void guide() {
    emit(USGuideState());
  }
}

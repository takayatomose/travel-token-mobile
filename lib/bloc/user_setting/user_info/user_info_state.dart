import 'package:xtrip_mobile/sessions/form_submission_status.dart';

class UserInfoState {
  final String fullName;
  final FormSubmissionStatus formStatus;
  UserInfoState({
    this.fullName = '',
    this.formStatus = const InitialFormStatus(),
  });
  UserInfoState copyWith({String? fullName, FormSubmissionStatus? formStatus}) {
    return UserInfoState(
        formStatus: formStatus ?? this.formStatus,
        fullName: fullName ?? this.fullName);
  }
}

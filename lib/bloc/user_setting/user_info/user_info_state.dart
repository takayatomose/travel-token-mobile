import 'package:xtrip_mobile/sessions/form_submission_status.dart';

class UserInfoState {
  final String fullName;
  final FormSubmissionStatus formStatus;
  final bool editing;
  UserInfoState({
    this.fullName = '',
    this.formStatus = const InitialFormStatus(),
    this.editing = false,
  });
  UserInfoState copyWith(
      {String? fullName, FormSubmissionStatus? formStatus, bool? editing}) {
    return UserInfoState(
        formStatus: formStatus ?? this.formStatus,
        fullName: fullName ?? this.fullName,
        editing: editing ?? this.editing);
  }
}

import 'package:xtrip_mobile/sessions/form_submission_status.dart';

class UserInfoState {
  final String fullName;
  final FormSubmissionStatus formStatus;
  final bool editing;
  final String invitationCode;
  UserInfoState(
      {this.fullName = '',
      this.formStatus = const InitialFormStatus(),
      this.editing = false,
      this.invitationCode = ''});
  UserInfoState copyWith(
      {String? fullName,
      FormSubmissionStatus? formStatus,
      bool? editing,
      String? invitationCode}) {
    return UserInfoState(
        formStatus: formStatus ?? this.formStatus,
        fullName: fullName ?? this.fullName,
        editing: editing ?? this.editing,
        invitationCode: invitationCode ?? this.invitationCode);
  }
}

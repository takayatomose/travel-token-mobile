import 'package:xtrip_mobile/sessions/form_submission_status.dart';

class ChangePasswordState {
  final String currentPassword;
  final String newPassword;
  final FormSubmissionStatus formStatus;
  ChangePasswordState({
    this.formStatus = const InitialFormStatus(),
    this.currentPassword = '',
    this.newPassword = '',
  });
  ChangePasswordState copyWith({
    FormSubmissionStatus? formStatus,
    String? currentPassword,
    String? newPassword,
  }) {
    return ChangePasswordState(
      formStatus: formStatus ?? this.formStatus,
      currentPassword: currentPassword ?? this.currentPassword,
      newPassword: newPassword ?? this.newPassword,
    );
  }
}

class SignUpState {
  final String invitationCode;
  final String fullName;
  final String email;
  final String password;

  SignUpState({
    this.invitationCode = '',
    this.email = '',
    this.fullName = '',
    this.password = '',
  });

  SignUpState copyWith(
      {String? invitationCode,
      String? email,
      String? fullName,
      String? password}) {
    return SignUpState(
        invitationCode: invitationCode ?? this.invitationCode,
        fullName: fullName ?? this.fullName,
        email: email ?? this.fullName,
        password: password ?? this.password);
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `A Product of TASTECH. LTD. CO`
  String get copyright {
    return Intl.message(
      'A Product of TASTECH. LTD. CO',
      name: 'copyright',
      desc: '',
      args: [],
    );
  }

  /// `Your account`
  String get yourAccount {
    return Intl.message(
      'Your account',
      name: 'yourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Repair`
  String get repair {
    return Intl.message(
      'Repair',
      name: 'repair',
      desc: '',
      args: [],
    );
  }

  /// `Shop`
  String get shop {
    return Intl.message(
      'Shop',
      name: 'shop',
      desc: '',
      args: [],
    );
  }

  /// `Items`
  String get items {
    return Intl.message(
      'Items',
      name: 'items',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Map`
  String get map {
    return Intl.message(
      'Map',
      name: 'map',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email address`
  String get emailEmptyError {
    return Intl.message(
      'Please enter your email address',
      name: 'emailEmptyError',
      desc: '',
      args: [],
    );
  }

  /// `Your full name`
  String get fullNameHint {
    return Intl.message(
      'Your full name',
      name: 'fullNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name`
  String get fullNameEmptyError {
    return Intl.message(
      'Please enter your name',
      name: 'fullNameEmptyError',
      desc: '',
      args: [],
    );
  }

  /// `Your email address`
  String get emailHint {
    return Intl.message(
      'Your email address',
      name: 'emailHint',
      desc: '',
      args: [],
    );
  }

  /// `Your password`
  String get passwordHint {
    return Intl.message(
      'Your password',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your password`
  String get confirmPasswordHint {
    return Intl.message(
      'Confirm your password',
      name: 'confirmPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Token balance`
  String get tokenBalance {
    return Intl.message(
      'Token balance',
      name: 'tokenBalance',
      desc: '',
      args: [],
    );
  }

  /// `Efficiency`
  String get efficiency {
    return Intl.message(
      'Efficiency',
      name: 'efficiency',
      desc: '',
      args: [],
    );
  }

  /// `Durability`
  String get durability {
    return Intl.message(
      'Durability',
      name: 'durability',
      desc: '',
      args: [],
    );
  }

  /// `Ability`
  String get ability {
    return Intl.message(
      'Ability',
      name: 'ability',
      desc: '',
      args: [],
    );
  }

  /// `Luck`
  String get luck {
    return Intl.message(
      'Luck',
      name: 'luck',
      desc: '',
      args: [],
    );
  }

  /// `Distance`
  String get distance {
    return Intl.message(
      'Distance',
      name: 'distance',
      desc: '',
      args: [],
    );
  }

  /// `Condition`
  String get condition {
    return Intl.message(
      'Condition',
      name: 'condition',
      desc: '',
      args: [],
    );
  }

  /// `My Items ({numOfItems})`
  String myItems(Object numOfItems) {
    return Intl.message(
      'My Items ($numOfItems)',
      name: 'myItems',
      desc: '',
      args: [numOfItems],
    );
  }

  /// `Go go shop`
  String get goToShop {
    return Intl.message(
      'Go go shop',
      name: 'goToShop',
      desc: '',
      args: [],
    );
  }

  /// `Travel To Earn`
  String get travelToEarn {
    return Intl.message(
      'Travel To Earn',
      name: 'travelToEarn',
      desc: '',
      args: [],
    );
  }

  /// `Already had account?`
  String get alreadyHadAccount {
    return Intl.message(
      'Already had account?',
      name: 'alreadyHadAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login with us`
  String get loginWithUs {
    return Intl.message(
      'Login with us',
      name: 'loginWithUs',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password`
  String get forgotPassword {
    return Intl.message(
      'Forgot password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get resetPassword {
    return Intl.message(
      'Reset password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `E-mail address`
  String get emailAddress {
    return Intl.message(
      'E-mail address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Input your registered email address, we will send you the link to reset your password. Please check your email and follow instructions.`
  String get forgotPasswordInstruction {
    return Intl.message(
      'Input your registered email address, we will send you the link to reset your password. Please check your email and follow instructions.',
      name: 'forgotPasswordInstruction',
      desc: '',
      args: [],
    );
  }

  /// `Enter code that you received via email and your new password`
  String get enterResetPasswordCode {
    return Intl.message(
      'Enter code that you received via email and your new password',
      name: 'enterResetPasswordCode',
      desc: '',
      args: [],
    );
  }

  /// `Need help?`
  String get needHelp {
    return Intl.message(
      'Need help?',
      name: 'needHelp',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Your recover code`
  String get yourRecoverCode {
    return Intl.message(
      'Your recover code',
      name: 'yourRecoverCode',
      desc: '',
      args: [],
    );
  }

  /// `Please your recover code`
  String get pleaseEnterRecovercode {
    return Intl.message(
      'Please your recover code',
      name: 'pleaseEnterRecovercode',
      desc: '',
      args: [],
    );
  }

  /// `Your new password`
  String get yourNewPassword {
    return Intl.message(
      'Your new password',
      name: 'yourNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please your new password`
  String get pleseNewPassword {
    return Intl.message(
      'Please your new password',
      name: 'pleseNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your new password`
  String get confirmNewPassword {
    return Intl.message(
      'Confirm your new password',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please re-enter password`
  String get pleaseEnterPwd {
    return Intl.message(
      'Please re-enter password',
      name: 'pleaseEnterPwd',
      desc: '',
      args: [],
    );
  }

  /// `Password does not match`
  String get pwdNotMatched {
    return Intl.message(
      'Password does not match',
      name: 'pwdNotMatched',
      desc: '',
      args: [],
    );
  }

  /// `Your new password`
  String get newPassword {
    return Intl.message(
      'Your new password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password Success`
  String get forgotPwdSuccess {
    return Intl.message(
      'Forgot Password Success',
      name: 'forgotPwdSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password Success`
  String get resetPasswordSuccess {
    return Intl.message(
      'Reset Password Success',
      name: 'resetPasswordSuccess',
      desc: '',
      args: [],
    );
  }

  /// `We sent you and an e-mail to instruction to reset password`
  String get sentEmailPwdInstruction {
    return Intl.message(
      'We sent you and an e-mail to instruction to reset password',
      name: 'sentEmailPwdInstruction',
      desc: '',
      args: [],
    );
  }

  /// `Your new password has been save! You can login now!`
  String get resetPwdSuccessMsg {
    return Intl.message(
      'Your new password has been save! You can login now!',
      name: 'resetPwdSuccessMsg',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Login to your account to keep traveling`
  String get loginHeadline {
    return Intl.message(
      'Login to your account to keep traveling',
      name: 'loginHeadline',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get enterPassword {
    return Intl.message(
      'Please enter your password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Don't have account? `
  String get donthaveAccount {
    return Intl.message(
      'Don\'t have account? ',
      name: 'donthaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your password`
  String get confirmPwd {
    return Intl.message(
      'Confirm your password',
      name: 'confirmPwd',
      desc: '',
      args: [],
    );
  }

  /// `Invitation code`
  String get invitationCode {
    return Intl.message(
      'Invitation code',
      name: 'invitationCode',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your invitation code`
  String get enterInvitationCode {
    return Intl.message(
      'Please enter your invitation code',
      name: 'enterInvitationCode',
      desc: '',
      args: [],
    );
  }

  /// `By creating the account, you agree with our `
  String get agreedCreatingAccount {
    return Intl.message(
      'By creating the account, you agree with our ',
      name: 'agreedCreatingAccount',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get termConditions {
    return Intl.message(
      'Terms and Conditions',
      name: 'termConditions',
      desc: '',
      args: [],
    );
  }

  /// `Your account has been created successfully! An email has been sent to your email address containing an activation code. Please use code to activate your account!`
  String get sentActivatedCode {
    return Intl.message(
      'Your account has been created successfully! An email has been sent to your email address containing an activation code. Please use code to activate your account!',
      name: 'sentActivatedCode',
      desc: '',
      args: [],
    );
  }

  /// `Account has been created!`
  String get createdAccount {
    return Intl.message(
      'Account has been created!',
      name: 'createdAccount',
      desc: '',
      args: [],
    );
  }

  /// `Signup Failed`
  String get signupFailed {
    return Intl.message(
      'Signup Failed',
      name: 'signupFailed',
      desc: '',
      args: [],
    );
  }

  /// `Create an account to get earning while traveling`
  String get creatingAccountToTravel {
    return Intl.message(
      'Create an account to get earning while traveling',
      name: 'creatingAccountToTravel',
      desc: '',
      args: [],
    );
  }

  /// `Activated Code`
  String get activatedCode {
    return Intl.message(
      'Activated Code',
      name: 'activatedCode',
      desc: '',
      args: [],
    );
  }

  /// `Account activate failed`
  String get activatedAccountFailed {
    return Intl.message(
      'Account activate failed',
      name: 'activatedAccountFailed',
      desc: '',
      args: [],
    );
  }

  /// `Account has been activated!`
  String get activatedAccount {
    return Intl.message(
      'Account has been activated!',
      name: 'activatedAccount',
      desc: '',
      args: [],
    );
  }

  /// `Your account has been activated successfully! You can signin to your account!`
  String get activatedAccountMsg {
    return Intl.message(
      'Your account has been activated successfully! You can signin to your account!',
      name: 'activatedAccountMsg',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your activation code`
  String get enterActivationCode {
    return Intl.message(
      'Please enter your activation code',
      name: 'enterActivationCode',
      desc: '',
      args: [],
    );
  }

  /// `Your email`
  String get yourEmail {
    return Intl.message(
      'Your email',
      name: 'yourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Your name`
  String get yourName {
    return Intl.message(
      'Your name',
      name: 'yourName',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong. Please try again later`
  String get somethingWrong {
    return Intl.message(
      'Something went wrong. Please try again later',
      name: 'somethingWrong',
      desc: '',
      args: [],
    );
  }

  /// `User Info updated`
  String get userInfoUpdated {
    return Intl.message(
      'User Info updated',
      name: 'userInfoUpdated',
      desc: '',
      args: [],
    );
  }

  /// `You have updated your information`
  String get userInfoUpdatedMsg {
    return Intl.message(
      'You have updated your information',
      name: 'userInfoUpdatedMsg',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get signOut {
    return Intl.message(
      'Sign out',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get version {
    return Intl.message(
      'Version',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `Contact us`
  String get contactUs {
    return Intl.message(
      'Contact us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `Guidance`
  String get guidance {
    return Intl.message(
      'Guidance',
      name: 'guidance',
      desc: '',
      args: [],
    );
  }

  /// `Disclosure`
  String get disclosure {
    return Intl.message(
      'Disclosure',
      name: 'disclosure',
      desc: '',
      args: [],
    );
  }

  /// `Invite your friend`
  String get inviteFriend {
    return Intl.message(
      'Invite your friend',
      name: 'inviteFriend',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get changePassword {
    return Intl.message(
      'Change password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `{token} balance`
  String xTokenBalance(Object token) {
    return Intl.message(
      '$token balance',
      name: 'xTokenBalance',
      desc: '',
      args: [token],
    );
  }

  /// `Invite`
  String get invite {
    return Intl.message(
      'Invite',
      name: 'invite',
      desc: '',
      args: [],
    );
  }

  /// `Your invitation code`
  String get yourInviteCode {
    return Intl.message(
      'Your invitation code',
      name: 'yourInviteCode',
      desc: '',
      args: [],
    );
  }

  /// `Invitation code copied!`
  String get copiedInviteCode {
    return Intl.message(
      'Invitation code copied!',
      name: 'copiedInviteCode',
      desc: '',
      args: [],
    );
  }

  /// `You have copied invitation code!`
  String get copiedInviteCodeMsg {
    return Intl.message(
      'You have copied invitation code!',
      name: 'copiedInviteCodeMsg',
      desc: '',
      args: [],
    );
  }

  /// `Email copied`
  String get emailCopied {
    return Intl.message(
      'Email copied',
      name: 'emailCopied',
      desc: '',
      args: [],
    );
  }

  /// `Email address copied!`
  String get emailCopiedMsg {
    return Intl.message(
      'Email address copied!',
      name: 'emailCopiedMsg',
      desc: '',
      args: [],
    );
  }

  /// `Send email to us:`
  String get sendUsEmail {
    return Intl.message(
      'Send email to us:',
      name: 'sendUsEmail',
      desc: '',
      args: [],
    );
  }

  /// `Your password has been updated`
  String get pwdUpdated {
    return Intl.message(
      'Your password has been updated',
      name: 'pwdUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get changePwd {
    return Intl.message(
      'Change password',
      name: 'changePwd',
      desc: '',
      args: [],
    );
  }

  /// `Your current password`
  String get currentPwd {
    return Intl.message(
      'Your current password',
      name: 'currentPwd',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your current password`
  String get enterCurrentPwd {
    return Intl.message(
      'Please enter your current password',
      name: 'enterCurrentPwd',
      desc: '',
      args: [],
    );
  }

  /// `Change your password`
  String get changeYourPwd {
    return Intl.message(
      'Change your password',
      name: 'changeYourPwd',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

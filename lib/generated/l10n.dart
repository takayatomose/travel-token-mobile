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

  /// `My Items`
  String get myItems {
    return Intl.message(
      'My Items',
      name: 'myItems',
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

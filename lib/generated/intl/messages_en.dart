// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(numOfItems) => "My Items (${numOfItems})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "ability": MessageLookupByLibrary.simpleMessage("Ability"),
        "account": MessageLookupByLibrary.simpleMessage("Account"),
        "condition": MessageLookupByLibrary.simpleMessage("Condition"),
        "confirmPasswordHint":
            MessageLookupByLibrary.simpleMessage("Confirm your password"),
        "copyright": MessageLookupByLibrary.simpleMessage(
            "A Product of TASTECH. LTD. CO"),
        "distance": MessageLookupByLibrary.simpleMessage("Distance"),
        "durability": MessageLookupByLibrary.simpleMessage("Durability"),
        "efficiency": MessageLookupByLibrary.simpleMessage("Efficiency"),
        "emailEmptyError": MessageLookupByLibrary.simpleMessage(
            "Please enter your email address"),
        "emailHint": MessageLookupByLibrary.simpleMessage("Your email address"),
        "fullNameEmptyError":
            MessageLookupByLibrary.simpleMessage("Please enter your name"),
        "fullNameHint": MessageLookupByLibrary.simpleMessage("Your full name"),
        "goToShop": MessageLookupByLibrary.simpleMessage("Go go shop"),
        "items": MessageLookupByLibrary.simpleMessage("Items"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "luck": MessageLookupByLibrary.simpleMessage("Luck"),
        "map": MessageLookupByLibrary.simpleMessage("Map"),
        "myItems": m0,
        "passwordHint": MessageLookupByLibrary.simpleMessage("Your password"),
        "repair": MessageLookupByLibrary.simpleMessage("Repair"),
        "shop": MessageLookupByLibrary.simpleMessage("Shop"),
        "tokenBalance": MessageLookupByLibrary.simpleMessage("Token balance"),
        "yourAccount": MessageLookupByLibrary.simpleMessage("Your account")
      };
}

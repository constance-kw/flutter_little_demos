// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_HK locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'zh_HK';

  static m0(role) => "${Intl.select(role, {'admin': 'Hi 超級管理員!', 'manager': 'Hi 管理員!', 'other': 'Hi 遊客!', })}";

  static m1(howMany) => "${Intl.plural(howMany, zero: '沒有未讀郵件', one: '有${howMany}封未讀郵件', other: '有${howMany}封未讀郵件')}";

  static m2(firstName, lastName) => "歡迎 ${firstName} ${lastName}! 妳好, ${firstName}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "hello" : MessageLookupByLibrary.simpleMessage("這是"),
    "pageHomeWelcomeRole" : m0,
    "remainingEmailsMessage" : m1,
    "title" : MessageLookupByLibrary.simpleMessage("Flutter應用"),
    "welcome" : m2,
    "world" : MessageLookupByLibrary.simpleMessage("繁體")
  };
}

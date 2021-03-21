// import 'package:dartz/dartz.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// part 'validate_email.freezed.dart';
//
// class EmailAddress {
//   final String value;
//   // final Either<Left, Right> failure;
//
//   factory EmailAddress(String input) {
//     assert(input != null);
//     return EmailAddress._(
//       ValidateEmail(input),
//     );
//   }
//
//   EmailAddress._(this.value);
//   @override
//   String toString() => 'EmailAddress($value)';
//
//   @override
//   bool operator ==(Object o) {
//     if (identical(this, o)) return true;
//
//     return o is EmailAddress && o.value == value;
//   }
//
//   @override
//   int get hashCode => value.hashCode;
// }
//
// String ValidateEmail(String input) {
//   RegExp emailRegex = RegExp(
//       r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""");
//   if (emailRegex.hasMatch(input)) {
//     return input;
//   } else
//     return '';
// }
//
// @freezed
// class ValueFailure<T> with _$ValueFailure<T> {
//   final String failedValue;
//   const factory ValueFailure.invalidEmail({@Default('') failedValue}) =
//       InvalidEmail<T>;
// }
// //https://github.com/rrousselGit/freezed/tree/master/packages/freezed#the-abstract-keyword

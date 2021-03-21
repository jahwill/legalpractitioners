import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:legalpractitioners/domain/auth/login_and_routepage.dart';

class ValidateItem {
  final String value;
  final String error;

  ///this class is the model for validatefield class for email and password
  ValidateItem(this.value, this.error);
}

class ValidateField with ChangeNotifier {
  ValidateItem _email = ValidateItem(null, null);
  ValidateItem _password = ValidateItem(null, null);
  bool load = true;
  String mal = '';
  //getter
  bool get isvalid {
    if (_email.value != null && _password.value != null) {
      return true;
    } else {
      return false;
    }
  }

  ValidateItem get email => _email;

  ValidateItem get password => _password;

  //setter
  Void setEmail(String value) {
    RegExp emailRegex = RegExp(
        r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""");
    if (emailRegex.hasMatch(value)) {
      _email = ValidateItem(value, null);
      mal = value;
    } else {
      _email = ValidateItem(null, 'not a valid email');
    }
    notifyListeners();
  }

  Void setPasswor(String value) {
    if (value.length > 6) {
      _password = ValidateItem(value, null);
      load = false;
    } else {
      _password = ValidateItem(null, 'password too short');
    }
    notifyListeners();
  }
}

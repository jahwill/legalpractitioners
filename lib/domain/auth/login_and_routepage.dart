import 'dart:async';

import 'package:flutter/cupertino.dart';

class LogInandRoutePage with ChangeNotifier {
  bool _isloading = false;
  var hg = '';
  String data(String mail, password) {
    if (mail == 'jjj@gmail.com' && password == '1234567') {
      return 'user';
    } else
      return 'not a user!';
  }

  Future<String> printback(mail, password) async {
    ///this method is use as testing to mimic the server response when signed
    /// in and the response is use to set the loading value and return a
    /// response to the screen page
    _isloading = true;
    var request = data(mail, password);
    notifyListeners();
    return Future.delayed(Duration(seconds: 6), () {
      if (request == 'user') {
        hg = 'is a user';
      } else {
        hg = 'don\'t know u';
        _isloading = false;
      }
      notifyListeners();
      return hg;
    });
  }

  // Future<String> signin() async {
  //   print(getFields.email.value);
  // }

  bool get isLoading => _isloading;

  ///this tells if user is logged in or not as this bool
  ///result will be use to flag if user can navigate to the next screen
  ///  or not it will all be used to set a loading icon as long as value
  ///  remains false showing the login process is still in progress

  setisLoading({bool loading}) {
    ///this method is use to set the loading value outside this class
    _isloading = loading;
    notifyListeners();
  }
}

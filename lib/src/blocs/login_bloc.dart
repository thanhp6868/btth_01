import 'dart:async';

import 'package:app_login/src/validators/validations.dart';

class LoginBloc {
  StreamController _usernameController = new StreamController();
  StreamController _passwordController = new StreamController();

  Stream get userStream => _usernameController.stream;
  Stream get passStream => _passwordController.stream;

  bool isValidInfo(String username, String pass) {
    if (validations.isValidUser(username)) {
      _usernameController.sink.addError('Tai khoan khong hop le');
      return false;
    }
    _usernameController.sink.add('OK');
    
    if (!validations.isValidPass(pass)) {
      _passwordController.sink.addError('mat khau tren 6 ky tu');
      return false;
    }

    _passwordController.sink.add('OK');
    return true;
  }

  void dispose() {
    _usernameController.close();
    _passwordController.close();
  }
}

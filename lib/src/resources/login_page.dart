import 'package:app_login/src/blocs/login_bloc.dart';
import 'package:flutter/material.dart';
import './home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc bloc = new LoginBloc();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passFocusNode = FocusNode();

  bool _showPass = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        shape: Border(
            bottom: BorderSide(
          width: 1,
        )),
        toolbarHeight: 150,
        title: Center(
          child: Text(
            'Sign in',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 50,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: StreamBuilder(
                  stream: bloc.userStream,
                  builder: (context, snapshot) => TextField(
                    controller: _usernameController,
                    focusNode: emailFocusNode,
                    decoration: InputDecoration(
                        labelText: 'Username',
                        hintText: 'Email hoặc số điện thoại',
                        errorText: snapshot.hasError
                            ? snapshot.error.toString()
                            : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child:
                  Stack(alignment: AlignmentDirectional.centerEnd, children: [
                StreamBuilder(
                  builder: (context, snapshot) => TextField(
                      controller: _passwordController,
                      focusNode: passFocusNode,
                      obscureText: !_showPass, // show hide password

                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Mật khẩu',
                        errorText: snapshot.hasError
                            ? snapshot.error.toString()
                            : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      )),
                ),
                GestureDetector(
                  onTap: show_hidePass,
                  child: Text(
                    _showPass ? 'Hide' : 'Show',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Quên mật khẩu?',
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                    ),
                    TextButton(
                      child: Text(
                        'Tạo tài khoản',
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                      onPressed: null,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: onClick,
                  child: Text(
                    'Đăng nhập',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void show_hidePass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void onClick() {
    if (bloc.isValidInfo(_usernameController.text, _passwordController.text)) {}
  }
}

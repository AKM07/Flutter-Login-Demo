import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/constant/constant.dart';
import 'package:flutter_demo/screens/HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}

class LogInScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      resizeToAvoidBottomPadding: true,
      body: new ListView(
        shrinkWrap: true,
        reverse: false,
        children: <Widget>[
          new SizedBox(
            height: 20.0,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                    child: new Text(
                      "Log In",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              new SizedBox(
                height: 30.0,
              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Image.asset(
                    "assets/images/logo.png",
                    height: 150.0,
                    width: 210.0,
                    fit: BoxFit.scaleDown,
                  ),
                ],
              ),
              new Center(
                child: new Center(
                  child: new Stack(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        child: new Form(
                          autovalidate: false,
                          child: new Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Padding(
                                padding:
                                    EdgeInsets.only(left: 10.0, right: 10.0),
                                child: new TextFormField(
                                  controller: emailController,
                                  autofocus: false,
                                  decoration: new InputDecoration(
                                      labelText: "Email",
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(right: 7.0),
                                        child: new Image.asset(
                                          "assets/images/user_icon.png",
                                          height: 25.0,
                                          width: 25.0,
                                          fit: BoxFit.scaleDown,
                                        ),
                                      )),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                              new Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0, right: 10.0, top: 10.0),
                                child: new TextFormField(
                                  obscureText: true,
                                  autofocus: false,
                                  controller: passwordController,
                                  decoration: new InputDecoration(
                                    labelText: "Password",
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(right: 7.0),
                                      child: new Image.asset(
                                        "assets/images/user_icon.png",
                                        height: 25.0,
                                        width: 25.0,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                              new Padding(
                                padding: EdgeInsets.only(
                                    left: 0.0, top: 45.0, bottom: 20.0),
                                child: new RaisedButton(
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                  ),
                                  onPressed: () {
                                    if (!(emailController.value.text.length <
                                        1)) {
                                      showToast(
                                          context, "Email tidak boleh kosong");
                                    } else if (!(passwordController
                                            .value.text.length <
                                        1)) {
                                      showToast(context,
                                          "Password tidak boleh kosong");
                                    } else {
                                      var root = MaterialPageRoute(
                                          builder: (context) => new HomeScreen(
                                              emailController.value.text
                                                  .toString()));
                                      Navigator.pushReplacement(context, root);
                                    }
                                  },
                                  child: new Text(
                                    "Login",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  color: Color(0xFF54C5F8),
                                  textColor: Colors.white,
                                  elevation: 5.0,
                                  padding: EdgeInsets.only(
                                      left: 80.0,
                                      right: 80.0,
                                      top: 15.0,
                                      bottom: 15.0),
                                ),
                              ),
                              new Column(
                                children: <Widget>[
                                  new FlatButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushNamed(SIGNUP_SCREEN);
                                      },
                                      child: new Padding(
                                        padding: EdgeInsets.only(top: 20.0),
                                        child: new Text(
                                          "Don't have account ?",
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: 15.0),
                                        ),
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showToast(BuildContext context, String message) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: 'OK',
          onPressed: scaffold.hideCurrentSnackBar,
        ),
      ),
    );
  }

  @override
  void dispose() {
    //membersihkan controller ketika widget di dispose
    // TODO: implement dispose
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:prueba_closure/utils/api.dart';
import 'package:prueba_closure/utils/utils.dart';
//https://github.com/samarthagarwal/FlutterScreens
//https://stackoverflow.com/questions/51774252/bottom-overloaded-by-213-pixels-in-flutter
//https://medium.com/@anilcan/working-with-routes-in-flutter-by-using-fluro-de9fba88127b

class SignupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SignupPageState();
  }
}

class _SignupPageState extends State<SignupPage> {
  final userController = new TextEditingController();
  final passController = new TextEditingController();
  final confirmController = new TextEditingController();

  @override
  void dispose() {
    // get rid of text controllers
    userController.dispose();
    passController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        decoration: new BoxDecoration(
          color: Colors.white,
          image: new DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.05), BlendMode.dstATop),
            image: new AssetImage('assets/images/mountains.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: new ListView(
          children: <Widget>[
            new Container(
              padding: new EdgeInsets.all(60.0),
              child: new Center(
                child: new Icon(
                  Icons.headset_mic,
                  color: Colors.limeAccent[700],
                  size: 50.0,
                ),
              ),
            ),
            new Row(
              children: <Widget>[
                new Expanded(
                  child: new Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: new Text(
                      "EMAIL",
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.limeAccent[700],
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            new Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                border: new Border(
                  bottom: new BorderSide(
                      color: Colors.limeAccent[700],
                      width: 0.5,
                      style: BorderStyle.solid),
                ),
              ),
              padding: const EdgeInsets.only(left: 0.0, right: 10.0),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Expanded(
                    child: new TextField(
                      controller: userController,
                      textAlign: TextAlign.left,
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                        hintText: 'youremail@...com',
                        hintStyle: new TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new Divider(
              height: 24.0,
            ),
            new Row(
              children: <Widget>[
                new Expanded(
                  child: new Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: new Text(
                      "PASSWORD",
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.limeAccent[700],
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            new Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                border: new Border(
                  bottom: new BorderSide(
                      color: Colors.limeAccent[700],
                      width: 0.5,
                      style: BorderStyle.solid),
                ),
              ),
              padding: const EdgeInsets.only(left: 0.0, right: 10.0),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Expanded(
                    child: new TextField(
                      controller: passController,
                      obscureText: true,
                      textAlign: TextAlign.left,
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                        hintText: '*********',
                        hintStyle: new TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new Divider(
              height: 24.0,
            ),
            new Row(
              children: <Widget>[
                new Expanded(
                  child: new Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: new Text(
                      "CONFIRM PASSWORD",
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.limeAccent[700],
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            new Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                border: new Border(
                  bottom: new BorderSide(
                      color: Colors.limeAccent[700],
                      width: 0.5,
                      style: BorderStyle.solid),
                ),
              ),
              padding: const EdgeInsets.only(left: 0.0, right: 10.0),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Expanded(
                    child: new TextField(
                      controller: confirmController,
                      obscureText: true,
                      textAlign: TextAlign.left,
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                        hintText: '*********',
                        hintStyle: new TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new Divider(
              height: 24.0,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: new FlatButton(
                    child: new Text(
                      "Already have an account?",
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.limeAccent[700],
                        fontSize: 15.0,
                      ),
                      textAlign: TextAlign.end,
                    ),
                    onPressed: () => Navigator.pushNamed(context, 'login'),
                  ),
                ),
              ],
            ),
            new Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
              alignment: Alignment.center,
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new FlatButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      color: Colors.limeAccent[700],
                      onPressed: () => _signup(userController.text, passController.text, confirmController.text),
                      child: new Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 20.0,
                        ),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Expanded(
                              child: new Text(
                                "SIGN UP",
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _signup(String user, String pass, String confirm) async {
    var content = "";
    if (user.isEmpty || pass.isEmpty) {
      content = "We need a username and a password. Please try again.";
    } else if (! isEmail(user)) {
      content = "The user should be an email. Please try again.";
    } else if (pass != confirm) {
      content = "Password and confirm do not match. Please try again.";
    } else {
      var api = new Api();
      var result = await api.newuser(user, pass);
      if (result==null) {
        content = "We are having problems login in. Please try again in some minutes.";
      } else {
        // TODO: sharedpreferences, then go to home page
        Navigator.pushNamed(context, 'signup');
      }
    }

    if (content.isNotEmpty) {
      getDialog(context, 'Sign in Error', content);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//https://github.com/samarthagarwal/FlutterScreens
//https://stackoverflow.com/questions/51774252/bottom-overloaded-by-213-pixels-in-flutter

class LoginScreen3 extends StatefulWidget {
  @override
  _LoginScreen3State createState() => new _LoginScreen3State();
}

class _LoginScreen3State extends State<LoginScreen3>
    with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  Widget HomePage() {
    return new Scaffold(
        body: new Container(
        height: MediaQuery.of(context).size.height,
        decoration: new BoxDecoration(
          color: Colors.limeAccent[700],
          image: new DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.1), BlendMode.dstATop),
            image: new AssetImage('assets/images/mountains.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: new Column(
          children: <Widget>[
            new Container(
              padding: new EdgeInsets.only(top: 150.0),
              child: new Center(
                child: new Icon(
                  Icons.headset_mic,
                  color: Colors.white,
                  size: 40.0,
                ),
              ),
            ),
            new Container(
              padding: new EdgeInsets.only(top: 20.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    "Awesome",
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  new Text(
                    "App",
                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            new Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 150.0),
              alignment: Alignment.center,
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new OutlineButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      color: Colors.limeAccent[700],
                      highlightedBorderColor: Colors.white,
                      onPressed: () => gotoSignup(),
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
            new Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
              alignment: Alignment.center,
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new FlatButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      color: Colors.white,
                      onPressed: () => gotoLogin(),
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
                                "LOGIN",
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                    color: Colors.limeAccent[700],
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

  Widget LoginPage() {
    return new Scaffold(
        body: new Container(
        height: MediaQuery.of(context).size.height,
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
              padding: new EdgeInsets.all(120.0),
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
              width: MediaQuery.of(context).size.width,
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
                      //obscureText: true,
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
              width: MediaQuery.of(context).size.width,
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
                      "Forgot Password?",
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.limeAccent[700],
                        fontSize: 15.0,
                      ),
                      textAlign: TextAlign.end,
                    ),
                    onPressed: () => {},
                  ),
                ),
              ],
            ),
            new Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
              alignment: Alignment.center,
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new FlatButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      color: Colors.limeAccent[700],
                      onPressed: () => {},
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
                                "LOGIN",
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
            new Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
              alignment: Alignment.center,
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Container(
                      margin: new EdgeInsets.all(8.0),
                      decoration: new BoxDecoration(border: new Border.all(width: 0.25)),
                    ),
                  ),
                  new Text(
                    "OR CONNECT WITH",
                    style: new TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  new Expanded(
                    child: new Container(
                      margin: new EdgeInsets.all(8.0),
                      decoration: new BoxDecoration(border: new Border.all(width: 0.25)),
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Container(
                      margin: new EdgeInsets.only(right: 8.0),
                      alignment: Alignment.center,
                      child: new Row(
                        children: <Widget>[
                          new Expanded(
                            child: new FlatButton(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              color: new Color(0Xff3B5998),
                              onPressed: () => {},
                              child: new Container(
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Expanded(
                                      child: new FlatButton(
                                        onPressed: ()=>{},
                                        padding: new EdgeInsets.only(
                                          top: 20.0,
                                          bottom: 20.0,
                                        ),
                                        child: new Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            new Icon(
                                              const IconData(0xea90,
                                                  fontFamily: 'icomoon'),
                                              color: Colors.white,
                                              size: 15.0,
                                            ),
                                            new Text(
                                              "FACEBOOK",
                                              textAlign: TextAlign.center,
                                              style: new TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
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
                  ),
                  new Expanded(
                    child: new Container(
                      margin: new EdgeInsets.only(left: 8.0),
                      alignment: Alignment.center,
                      child: new Row(
                        children: <Widget>[
                          new Expanded(
                            child: new FlatButton(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              color: new Color(0Xffdb3236),
                              onPressed: () => {},
                              child: new Container(
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Expanded(
                                      child: new FlatButton(
                                        onPressed: ()=>{},
                                        padding: new EdgeInsets.only(
                                          top: 20.0,
                                          bottom: 20.0,
                                        ),
                                        child: new Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            new Icon(
                                              const IconData(0xea88,
                                                  fontFamily: 'icomoon'),
                                              color: Colors.white,
                                              size: 15.0,
                                            ),
                                            new Text(
                                              "GOOGLE",
                                              textAlign: TextAlign.center,
                                              style: new TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
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
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget SignupPage() {
    return new Scaffold(
        body: new Container(
        height: MediaQuery.of(context).size.height,
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
              padding: new EdgeInsets.all(100.0),
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
              width: MediaQuery.of(context).size.width,
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
                      obscureText: true,
                      textAlign: TextAlign.left,
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                        hintText: 'samarthagarwal@live.com',
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
              width: MediaQuery.of(context).size.width,
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
              width: MediaQuery.of(context).size.width,
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
                    onPressed: () => {},
                  ),
                ),
              ],
            ),
            new Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 50.0),
              alignment: Alignment.center,
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new FlatButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      color: Colors.limeAccent[700],
                      onPressed: () => {},
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

  gotoLogin() {
    //controller_0To1.forward(from: 0.0);
    _controller.animateToPage(
      0,
      duration: new Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }

  gotoSignup() {
    //controller_minus1To0.reverse(from: 0.0);
    _controller.animateToPage(
      2,
      duration: new Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }

  PageController _controller = new PageController(initialPage: 1, viewportFraction: 1.0);

  @override
  Widget build(BuildContext context) {
    return new Container(
        height: MediaQuery.of(context).size.height,
//      child: new GestureDetector(
//        onHorizontalDragStart: _onHorizontalDragStart,
//        onHorizontalDragUpdate: _onHorizontalDragUpdate,
//        onHorizontalDragEnd: _onHorizontalDragEnd,
//        behavior: HitTestBehavior.translucent,
//        child: Stack(
//          children: <Widget>[
//            new FractionalTranslation(
//              translation: Offset(-1 - (scrollPercent / (1 / numCards)), 0.0),
//              child: SignupPage(),
//            ),
//            new FractionalTranslation(
//              translation: Offset(0 - (scrollPercent / (1 / numCards)), 0.0),
//              child: HomePage(),
//            ),
//            new FractionalTranslation(
//              translation: Offset(1 - (scrollPercent / (1 / numCards)), 0.0),
//              child: LoginPage(),
//            ),
//          ],
//        ),
//      ),
        child: new PageView(
          controller: _controller,
          physics: new AlwaysScrollableScrollPhysics(),
          children: <Widget>[LoginPage(), HomePage(), SignupPage()],
          scrollDirection: Axis.horizontal,
        ));
  }
}

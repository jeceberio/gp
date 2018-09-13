import 'package:flutter/material.dart';
//https://github.com/samarthagarwal/FlutterScreens
//https://stackoverflow.com/questions/51774252/bottom-overloaded-by-213-pixels-in-flutter
//https://medium.com/@anilcan/working-with-routes-in-flutter-by-using-fluro-de9fba88127b

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
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
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    "groupiki",
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                  new Text(
                    "let's do something BIG together",
                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            new Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              margin: const EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 150.0),
              alignment: Alignment.center,
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new OutlineButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      color: Colors.limeAccent[700],
                      highlightedBorderColor: Colors.white,
                      onPressed: () => Navigator.pushNamed(context, 'signup'),
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
                          borderRadius: new BorderRadius.circular(30.0)),
                      color: Colors.white,
                      onPressed: () => Navigator.pushNamed(context, 'login'),
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
}

// anyado cacher con herencia


import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ProductCacher dataCacher;

  @override
  void initState() {
    super.initState();
    dataCacher = new ProductCacher();
  }

  @override
  Widget build(BuildContext context) {
    var listView = new ListView.builder(
        itemCount: dataCacher._total,
        itemBuilder: (BuildContext context, int index) {
          var data = dataCacher._getData(index);
          return new ListTile(
            title: new Text(data.name),
          );
        });

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("App Bar Title"),
      ),
      body: listView,
    );
  }

}

class Data {
  int id;

  Data(int index){
    id = index;
  }

}

class Product extends Data {
  int id;
  String name;

  Product(int index): super(index){
    id = index;
    name = index.toString();
  }

}


//typedef S ItemCreator<S>(Map map);

class DataCacher {
  //var cacheddata;
  //ItemCreator<T> creator;
  //var offsetLoaded = new Map<int, bool>();
  int _total = 7;

  DataCacher();

  Data _getData(int index) {
    return new Data(index);
  }

}

class ProductCacher extends DataCacher {
  //var cacheddata;
  //ItemCreator<T> creator;
  //var offsetLoaded = new Map<int, bool>();
  int _total = 7;

  ProductCacher();

  Product _getData(int index) {
    return new Product(index);
  }

}


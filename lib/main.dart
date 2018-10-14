//cacher generico con herencia
//OJO a que el constructor de product NO tiene el index y funciona, pq lo hace el super
// metidos map

import 'package:flutter/material.dart';

import 'package:fluro/fluro.dart';
import 'package:prueba_closure/pages/home.dart';
import 'package:prueba_closure/pages/login.dart';
import 'package:prueba_closure/pages/signup.dart';
import 'package:prueba_closure/pages/forgot.dart';
import 'package:prueba_closure/pages/postList.dart';

//void main() => runApp(new MyApp());
void main() {
  Router router = new Router();
  router.define('home', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new HomePage();
  }));
  router.define('login', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new LoginPage();
  }));
  router.define('signup', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new SignupPage();
  }));
  router.define('forgot', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new ForgotPage();
  }));
  router.define('postList', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new PostList();
  }));

  runApp(new MaterialApp(
      title: 'groupiki',
      theme: new ThemeData(
        primarySwatch: Colors.lime,
      ),
      home: new HomePage(),
      onGenerateRoute: router.generator // Use our Fluro routers for this app.
  ));
}
/*
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'groupiki',
      theme: new ThemeData(
        primarySwatch: Colors.lime,
      ),
      home: new Container( child: new LoginScreen3(), ),//new MyHomePage(title: 'Flutter Demo Home Page'),
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
    dataCacher = new ProductCacher(() => setState((){}));
    dataCacher.getTotal().then((res){
      setState((){});
    });
  }

  @override
  Widget build(BuildContext context) {
    var listView = new ListView.builder(
        itemCount: dataCacher._total,
        itemBuilder: (BuildContext context, int index) {
          var data = dataCacher._getData(index);
          if (data != null) {
            return new ListTile(
              title: new Text(data.id.toString() + ' / ' + data.name),
              //title: new Text('hola'),
            );
          };
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

  Data(Map<String, dynamic> values){
    if (values.isEmpty) {
      id = 0;
      //image_small = BASE64.decode(tempImage);
    } else {
      id = values['id'];
    }
  }

}

class Product extends Data {
  String name;

  Product(Map<String, dynamic> values): super(values){
    if (values.isEmpty) {
      name = "Loading...";
      //image_small = BASE64.decode(tempImage);
    } else {
      name = new Utf8Decoder().convert(values['name'].codeUnits);
      /*
      var temp;
      if (map['image_small'] != false) {
        temp = map['image_small'].replaceAll("\n", "").replaceAll("\r\n", "");
      }
      else {
        temp = tempImage;
      }
      image_small = BASE64.decode(temp);
       */
    }
  }

}

typedef void RepaintCallback();
typedef S ItemCreator<S>(Map<String, dynamic> values);

class DataCacher<T> {
  var cacheddata;
  ItemCreator<T> creator;
  var offsetLoaded = new Map<int, bool>();
  int _total = -1;
  final RepaintCallback callback;
  var api = new Api();

  DataCacher(this.callback, ItemCreator<T> this.creator){
    cacheddata = new Map<int, T>();
  }

  T _getData(int index) {
    T data = cacheddata[index];
    if (data == null) {
      int offset = index ~/ 5 * 5;
      if (!offsetLoaded.containsKey(offset)) {
        offsetLoaded.putIfAbsent(offset, () => true);
        api.getDatas(offset, 5)
            .then((List valuesList) {
              if (valuesList != null && valuesList.isNotEmpty) {
                _updateDatas(offset, valuesList);
              } else {
                //TODO
              }
            });
      }
    }
    return data;
  }

  Future getTotal() async {
    _total = await api.getTotal();
    return true;
  }

  void _updateDatas(int offset, List valuesList) {
    var datas = new List<T>();
    //valuesList.forEach((Map<String, dynamic> map) => datas.add(creator(map));
    valuesList.forEach((element) => datas.add(creator(element)));
    /*var jsonOne = valuesList[0];
    print(jsonOne);
    T dataOne = creator(jsonOne);
    datas.add(dataOne);
    */
    //
    for (int i = 0; i < datas.length; i++) {
      cacheddata.putIfAbsent(offset + i, () => datas[i]);
    }
    // avisamos de que se ha cargado nuevos datos para que se redibuje el padre
    callback();
  }
}

class ProductCacher extends DataCacher {
  ProductCacher(callback): super(callback,(map)=> new Product(map));
}

*/

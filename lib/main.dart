import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:xml_rpc/client.dart' as xml_rpc;
import 'package:flutter/foundation.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ProductCacher dataCacher;

  @override
  void initState() {
    super.initState();
    dataCacher = new ProductCacher(callback: () => setState((){}));
    dataCacher.getTotal().then((res){
      setState((){});
    });

  }

  @override
  Widget build(BuildContext context) {
    print("build");
    var listView = new ListView.builder(
        itemCount: dataCacher._total,
        itemBuilder: (BuildContext context, int index) {
          var data = dataCacher._getData(index);
          return new ListTile(
            leading: new Image.memory(data.image_small),
            title: new Text(data.value),
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => new ProductScreen(dataCacher: dataCacher, index: index),
                ),
              );
            },
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

typedef void RepaintCallback();

class ProductCacher extends DataCacher {
  final fields = ['id', 'name', 'image_small'];
  ProductCacher({callback}): super(callback: callback, creator:(m)=>new Product(m));
}

class Product extends Data {
  int id;
  String name;
  Uint8List image_small;

  Product(Map map<String, dynamic>={}){
    if (map.isEmpty()) {
      id = 0;
      name = "Loading...";
      image_small = BASE64.decode(tempImage);
    } else {
      id = map['id'];
      name = new Utf8Decoder().convert(map['name'].codeUnits);
      var temp;
      if (map['image_small'] != false) {
        temp = map['image_small'].replaceAll("\n", "").replaceAll("\r\n", "");
      }
      else {
        temp = tempImage;
      }
      image_small = BASE64.decode(temp);
    }
  };

}

typedef S ItemCreator<S>(Map map);

abstract class DataCacher<T> {
  var cacheddata;
  //https://stackoverflow.com/questions/23112130/creating-an-instance-of-a-generic-type-in-dart
  //https://stackoverflow.com/questions/23094392/passing-a-class-type-as-a-variable-in-dart?rq=1
  /*
  typedef S ItemCreator<S>();

  class PagedListData<T>{
    ItemCreator<T> creator;
    PagedListData(ItemCreator<T> this.creator) {}

    void performMagic() {
        T item = creator();
        ...
    }
  }
  PagedListData<UserListItem> users = new PagedListData<UserListItem>(()=> new UserListItem());
  */
  ItemCreator<T> creator;
  var offsetLoaded = new Map<int, bool>();
  final RepaintCallback callback;
  int _total = -1;

  DataCacher({this.callback, this.creator(Map map)}) {
    cacheddata = new Map<int, T>();
  }

  T _getData(int index) {
    T data = cacheddata[index];
    if (data == null) {
      int offset = index ~/ 5 * 5;
      if (!offsetLoaded.containsKey(offset)) {
        offsetLoaded.putIfAbsent(offset, () => true);
        var api = new Api();
        api._getDatas(offset, 5)
            .then((List json) => _updateDatas(offset, json));
      }
      data = creator();
    }
    return data;
  }

  Future getTotal() async {
    var api = new Api();
    _total = await api._getTotal();
    return true;
  }

  void _updateDatas(int offset, List json) {
      var datas = new List<T>();
      json.forEach((Map map) => datas.add(creator(map));
      for (int i = 0; i < datas.length; i++) {
        cacheddata.putIfAbsent(offset + i, () => datas[i]);
      }
      // avisamos de que se ha cargado nuevos datos para que se redibuje el padre
      callback();
  }
}

class Data {
  int id;
  //String value;
  //Uint8List image_small;
  String tempImage = "iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO";

  Data(Map map<String, dynamic>={}){
    if (map.isEmpty()) {
      id = 0;
    } else {
      id = map['id'];
      /*
      value = new Utf8Decoder().convert(map['name'].codeUnits);
      var temp;
      if (map['image_small'] != false) {
        temp = map['image_small'].replaceAll("\n", "").replaceAll("\r\n", "");
      }
      else {
        temp = "iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO";
      }
      image_small = BASE64.decode(temp);
      */
    }
  };

}

class ProductScreen extends StatelessWidget {
  final int index;
  final ProductCacher productCacher;
  ProductScreen({Key key, @required this.productCacher, @required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Product product = productCacher._getData(index);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("${product.name}"),
      ),
      body: new Padding(
        padding: new EdgeInsets.all(16.0),
        child: new Image.memory(product.image_small)
      ),
    );
  }
}

class Api {
  static final urlA = 'http://demo.digital5.es:8069/xmlrpc/2/common';
  static final urlB = 'http://demo.digital5.es:8069/xmlrpc/2/object';
  static final db = 'ltz_v01';
  static final version = '0.1';

  Future<int> login(String user, String pass) async {
    Completer completer = new Completer();
    xml_rpc.call(urlA, 'version', []).then((result) {
      xml_rpc.call(urlA, 'authenticate',
          [db, user, pass, {}]).then((uid) {
        completer.complete(uid);
      }).catchError((error2) {
        print(error2);
        completer.complete(null);
      });
    }).catchError((error) {
      print(error);
      completer.complete(null);
    });
    return completer.future;
  }

  Future<List> searchRead(String model, List<String> fields, List args, Map kwargs, int offset, int limit) async {

  }

  Future<List> searchCount(String model, List args, Map kwargs) async {

  }

  Future<List> _getDatas(int offset, int limit) async {
    // 10.0.2.2 es el localhost de la VM
    Completer completer = new Completer();

    xml_rpc.call(urlA, 'version', []).then((result) {
      //print(result);
      xml_rpc.call(urlA, 'authenticate',
          ['ltz_v01', 'admin', 'xxx', {}]).then((uid) {
        Map search_kwargs = {'limit': limit};
        if (offset != null) {
          search_kwargs['offset'] = offset;
        }
        //print('busco kwargs:');
        //print(search_kwargs);
        xml_rpc.call(urlB, 'execute_kw', [
          'ltz_v01',
          uid,
          'xxx',
          'product.template',
          'search',
          [[]],
          search_kwargs
        ]).then((result3) {
          //print('devuelven productos:');
          //print(result3);

          xml_rpc.call(urlB, 'execute_kw', [
            'ltz_v01',
            uid,
            'xxx',
            'product.template',
            'read',
            [result3],
            {'fields': ['name', 'id','image_small']}
          ]).then((result4) {
            //print('devuelven producto:');
            //print(result4);

            //List<Map> list = JSON.decode(json);

            //var datas = new List<T>();
            //result4.forEach((Map map) => datas.add(new datatype.fromMap(map)));
            // completer.complete(datas);
            completer.complete(result4);
          }).catchError((error4) {
            print(error4);
            completer.complete(null);
          });
          //  }
        }).catchError((error3) {
          print(error3);
          completer.complete(null);
        });
      }).catchError((error2) {
        print(error2);
        completer.complete(null);
      });
    }).catchError((error) {
      print(error);
      completer.complete(null);
    });
    return completer.future;
  }

  Future<int> _getTotal() async {
    // 10.0.2.2 es el localhost de la VM
    Completer completer = new Completer();

    xml_rpc.call(urlA, 'version', []).then((result) {
      print(result);
      xml_rpc.call(urlA, 'authenticate',
          ['ltz_v01', 'admin', 'xxx', {}]).then((uid) {
        xml_rpc.call(urlB, 'execute_kw', [
          'ltz_v01',
          uid,
          'xxx',
          'product.template',
          'search_count',
          [[]],
          {}
        ]).then((result3) {
          int no_final = result3;
          print('devuelven no productos:');
          print(result3);
          completer.complete(no_final);
        }).catchError((error3) {
          print(error3);
          completer.complete(null);
        });
      }).catchError((error2) {
        print(error2);
        completer.complete(null);
      });
    }).catchError((error) {
      print(error);
      completer.complete(null);
    });
    return completer.future;
  }

}

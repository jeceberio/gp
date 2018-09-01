import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xml_rpc/client.dart' as xml_rpc;

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
  var cacheddata = new Map<int, Data>();
  var offsetLoaded = new Map<int, bool>();

  int _total = 0;

  @override
  void initState() {
    _getTotal().then((int total) {
      setState(() {
        _total = total;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var listView = new ListView.builder(
        itemCount: _total,
        itemBuilder: (BuildContext context, int index) {
          Data data = _getData(index);
          return new ListTile(
            title: new Text(data.value),
          );
        });

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("App Bar Title"),
      ),
      body: listView,
    );
  }

  Future<List<Data>> _getDatas(int offset, int limit) async {
    //String json = await _getJson(offset, limit);
    // 10.0.2.2 es el localhost de la VM
    print('entro');
    Completer completer = new Completer();
    final url = 'http://demo.digital5.es:8069/xmlrpc/2/common';
    final url2 = 'http://demo.digital5.es:8069/xmlrpc/2/object';

    xml_rpc.call(url, 'version', []).then((result) {
      print(result);
      xml_rpc.call(url, 'authenticate',
          ['ltz_v01', 'admin', 'xxx', {}]).then((uid) {
        Map search_kwargs = {'limit': limit};
        if (offset != null) {
          search_kwargs['offset'] = offset;
        }
        print('busco kwargs:');
        print(search_kwargs);
        xml_rpc.call(url2, 'execute_kw', [
          'ltz_v01',
          uid,
          'xxx',
          'product.template',
          'search',
          [[]],
          search_kwargs
        ]).then((result3) {
          print('devuelven productos:');
          print(result3);

          xml_rpc.call(url2, 'execute_kw', [
            'ltz_v01',
            uid,
            'xxx',
            'product.template',
            'read',
            [result3],
            {'fields': ['name', 'id']}
          ]).then((result4) {
            print('devuelven producto:');
            print(result4);

            //List<Map> list = JSON.decode(json);

            var datas = new List<Data>();
            result4.forEach((Map map) => datas.add(new Data.fromMap(map)));


            completer.complete(datas);
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

  Future<String> _getJson(int offset, int limit) async {
    String json = "[";

    for (int i = offset; i < offset + limit; i++) {
      String id = i.toString();
      String value = "value ($id)";
      json += '{ "id":"$id", "name":"$value" }';
      if (i < offset + limit - 1) {
        json += ",";
      }
    }

    json += "]";

    await new Future.delayed(new Duration(seconds: 3));

    return json;
  }

  Data _getData(int index) {
    Data data = cacheddata[index];
    if (data == null) {
      int offset = index ~/ 5 * 5;
      if (!offsetLoaded.containsKey(offset)) {
        offsetLoaded.putIfAbsent(offset, () => true);
        _getDatas(offset, 5)
            .then((List<Data> datas) => _updateDatas(offset, datas));
      }
      data = new Data.loading();
    }

    return data;
  }

  Future<int> _getTotal() async {
    // 10.0.2.2 es el localhost de la VM
    print('entro');
    Completer completer = new Completer();
    final url = 'http://demo.digital5.es:8069/xmlrpc/2/common';
    final url2 = 'http://demo.digital5.es:8069/xmlrpc/2/object';

    xml_rpc.call(url, 'version', []).then((result) {
      print(result);
      xml_rpc.call(url, 'authenticate',
          ['ltz_v01', 'admin', 'xxx', {}]).then((uid) {
        xml_rpc.call(url2, 'execute_kw', [
          'ltz_v01',
          uid,
          'xxx',
          'product.template',
          'search_count',
          [[]],
          {}
        ]).then((result3) {
          print('devuelven no productos:');
          print(result3);
          completer.complete(result3);
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

  void _updateDatas(int offset, List<Data> datas) {
    setState(() {
      for (int i = 0; i < datas.length; i++) {
        cacheddata.putIfAbsent(offset + i, () => datas[i]);
      }
    });
  }
}

class Data {
  int id;
  String value;

  Data.loading() {
    value = "Loading...";
  }

  Data.fromMap(Map map) {
    id = map['id'];
    value = map['name'];
  }
}

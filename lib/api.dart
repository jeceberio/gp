
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:xml_rpc/client.dart' as xml_rpc;

class Api {
  static final urlA = 'http://demo.digital5.es:8069/xmlrpc/2/common';
  static final urlB = 'http://demo.digital5.es:8069/xmlrpc/2/object';
  static final db = 'ltz_v01';
  static final clientVersion = '0.1';

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

  Future<List> getDatas(int offset, int limit) async {
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
            {'fields': ['name', 'id']}
            //{'fields': ['name', 'id','image_small']}
          ]).then((result4) {
            print('devuelven producto:');
            print(result4);

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

  Future<int> getTotal() async {
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


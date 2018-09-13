/*
A collection of methods that are useful
 */
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:async';
import 'dart:convert';

/**
 * checks if a string is an email
 * returns boolean
 */
bool isEmail(String em) {
  String p = r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
  RegExp regExp = new RegExp(p);
  return regExp.hasMatch(em);
}

/**
 * store key value
 * use library FlutterSecureStorage
 * casting of different types too string
 *
 * final _storage = new LocalStorage();

    Future _getValue() async {
    String _someValue = await _storage.readValue('someKey');
    }

    to debug:
    var a = await _storage.storage.readAll();
 */
class LocalStorage {
  final storage = new FlutterSecureStorage();

  void writeValue(String key, value) {
    // TODO: possible use of shared preferences if not private
    var prefix = "str";
    if (value is int) {
      prefix = "int";
      value = value.toString();
    } else if (value is double) {
      prefix = "dou";
      value = value.toString();
    } else if (value is bool) {
      prefix = "boo";
      value = value.toString();
    } else if (value is List) {
      prefix = "lis";
      value = json.encode(value);
    } else if (value is Map) {
      prefix = "map";
      value = json.encode(value);
    }
    storage.write(key: key, value: prefix + "_" + value);
  }

  void deleteValue(String key) async {
    await storage.delete(key: key);
  }

  Future readValue(String key) async {
    String value = await storage.read(key: key);
    var value2;
    if (value.substring(3,4)=="_") {
      var prefix = value.substring(0,3);
      value = value.substring(4,value.length);
      if (prefix == "int") {
        value2 = int.parse(value);
      } else if (prefix == "dou") {
        value2 = double.parse(value);
      } else if (prefix == "boo") {
        value2 = value.toLowerCase() == 'true';
      } else if (prefix == "lis") {
        value2 = json.decode(value);
      } else if (prefix == "map") {
        value2 = json.decode(value);
      }
    } else {
      value2 = value;
    }
    return value2;
  }

}

/*
returns the simple showDialog without any buttons,
  user can tap anywhere to get rid of it
context: dont know way
title: title
content: the text down
 */
Future<T> getDialog<T>(context, String title, String content) {
  return showDialog<Null>(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text(
            title,
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.limeAccent[700],
              fontSize: 15.0,
            ),
          ),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text(
                  content,
                ),
              ],
            ),
          ),
        );
      }
  );
}
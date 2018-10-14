import 'package:prueba_closure/utils/api.dart';
import 'dart:async';

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


typedef void RepaintCallback();
typedef S ItemCreator<S>(Map<String, dynamic> values);

class DataCacher<T> {
  String model = "";
  var cacheddata;
  ItemCreator<T> creator;
  var offsetLoaded = new Map<int, bool>();
  int total = -1;
  final RepaintCallback callback;
  var api = new Api();

  DataCacher(this.callback, ItemCreator<T> this.creator){
    cacheddata = new Map<int, T>();
  }

  T getData(int index) {
    T data = cacheddata[index];
    if (data == null) {
      int offset = index ~/ 5 * 5;
      if (!offsetLoaded.containsKey(offset)) {
        offsetLoaded.putIfAbsent(offset, () => true);
        api.searchRead(model, offset:offset)
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
    total = await api.searchCount(this.model);
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
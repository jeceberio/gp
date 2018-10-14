import 'package:prueba_closure/utils/model.dart';
import 'dart:convert';

class Post extends Data {
  String name;

  Post(Map<String, dynamic> values): super(values){
    if (values.isEmpty) {
      name = "Loading...";
      //image_small = BASE64.decode(tempImage);
    } else {
      name = new Latin1Decoder().convert(values['name'].codeUnits);
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

class PostCacher extends DataCacher {
  String model = 'gp.post';
  PostCacher(callback): super(callback,(map)=> new Post(map));
}
import 'package:flutter/material.dart';
import 'package:prueba_closure/models/post.dart';

class PostList extends StatefulWidget {
  PostList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PostList createState() => new _PostList();
}

class _PostList extends State<PostList> {
  PostCacher dataCacher;

  @override
  void initState() {
    super.initState();
    dataCacher = new PostCacher(() => setState((){}));
    dataCacher.getTotal().then((res){
      setState((){});
    });
  }

  @override
  Widget build(BuildContext context) {
    var listView = new ListView.builder(
        itemCount: dataCacher.total,
        itemBuilder: (BuildContext context, int index) {
          var data = dataCacher.getData(index);
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
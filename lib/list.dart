import 'package:flutter/material.dart'; // 导入了Material UI组件库

class ListViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget divider1 = const Divider(color: Colors.blue,);
    Widget divider2 = const Divider(color: Colors.green,);
    /*return
        // 无分割线的listView
      ListView.builder(
        itemCount: 100,
        itemExtent: 50.0,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text('$index'));
        },
      );*/
    // 带分割线的listView
    return ListView.separated(
        itemBuilder: (BuildContext context,int index){
          return ListTile(title: Text("$index"),);
        },
        separatorBuilder: (BuildContext context,int index) {
            return index%2 == 0? divider1 : divider2;
        },
        itemCount: 100);
  }


}
import 'package:flutter/material.dart'; // 导入了Material UI组件库

class ListViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      ListView.builder(
        itemCount: 100,
        itemExtent: 50.0,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text('$index'));
        },
      );
  }


}
import 'package:flutter/material.dart';

class GridViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GridView"),),
      body: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,//横轴3个子控件
        childAspectRatio: 1.0//宽高比为1时
      ),
          children: [
            Icon(Icons.ac_unit),
            Icon(Icons.arrow_upward),
            Icon(Icons.abc_rounded),
            Icon(Icons.access_alarm),
            Icon(Icons.adb_rounded),
            Icon(Icons.arrow_forward),
          ],
      ),
    );
  }

}
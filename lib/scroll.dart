import 'package:flutter/material.dart'; // 导入了Material UI组件库

class SingleChildScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scrollbar(
        child: SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          children: str
              .split("")
              .map((e) => Text(
                    e,
                    textScaleFactor: 2.0,
                  ))
              .toList(),
        ),
      ),
    ));
  }
}

// 知识点
// 通知冒泡和用户触摸事件
// 区别: 通知冒泡可以中止，但用户触摸事件不行

import 'package:flutter/material.dart';

class MyNotification extends Notification {
  MyNotification(this.msg);

  final String msg;
}

class NotificationRoute extends StatefulWidget {
  @override
  State createState() {
    return _NotificationState();
  }
}

class _NotificationState extends State<NotificationRoute> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
        child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Builder(builder: (context) {
            return ElevatedButton(
                onPressed: () => MyNotification("HI").dispatch(context),
                child: Text('Send Notification'));
          }),
          Text(_msg)
        ],
      ),
    ));
  }
}

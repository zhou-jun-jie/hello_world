import 'package:flutter/material.dart';

class ScrollNotificationTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollNotificationTestRouteState();
  }
}

class ScrollNotificationTestRouteState
    extends State<ScrollNotificationTestRoute> {
  String _progress = "0%";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('滚动监听'),),
      body: Scrollbar(
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              double progress =
                  notification.metrics.pixels / notification.metrics.maxScrollExtent;
              setState(() {
                _progress = "${(progress * 100).toInt()}%";
              });
              print("BottomEdge:${notification.metrics.extentAfter}");
              return false;
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                ListView.builder(
                    itemCount: 100,
                    itemExtent: 50,
                    itemBuilder: (context, index) => ListTile(
                      title: Text("$index"),
                    )),
                CircleAvatar(
                  radius: 30.0,
                  child: Text(_progress),
                  backgroundColor: Colors.black54,
                )
              ],
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';

class GestureWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GestureState();
  }
}

class _GestureState extends State<GestureWidget> {

  String _operation = "No Gesture detected";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          width: 200.0,
          height: 100.0,
          child: Text(
            _operation,
            style: TextStyle(color: Colors.white),
          ),
        ),
        onTap: () => updateText("Tap"), //点击
        onDoubleTap: ()=>updateText("DoubleTap"),
        onLongPress: ()=>updateText("LongPress"),
      ),
    );
  }

  void updateText(String text) {
    setState(() {
      _operation = text;
    });
  }
}

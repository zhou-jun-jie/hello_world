import 'package:flutter/material.dart';

class PointerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PointerState();
  }

}

class _PointerState extends State<PointerWidget> {

  PointerEvent? _event;

  @override
  Widget build(BuildContext context) {
    /*return Listener(
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        width: 300.0,
        height: 150.0,
        child: Text(
          '${_event?.localPosition?? ''}',
          style: TextStyle(color: Colors.white),
        ),
      ),
      onPointerDown: (PointerDownEvent event)=> setState(() {
        _event = event;
      }),
      onPointerMove: (PointerMoveEvent event) => setState(() => _event = event),
      onPointerUp: (PointerUpEvent event) => setState(() => _event = event),
    );*/
    // 点击Container时，由于它在AbsorbPointer的子树上，所以不会响应指针事件，所以日志不会输出"in"，
    // 但AbsorbPointer本身是可以接收指针事件的，所以会输出"up"。
    return Listener(
      child: AbsorbPointer(
        child: Listener(
          child: Container(
            color: Colors.red,
            width: 200.0,
            height: 100.0,
          ),
          onPointerDown: (event)=>print("in"),
        ),
      ),
      onPointerDown: (event)=>print("up"),
    );
  }

}
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DragWidgetRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DragState();
  }
}

class _DragState extends State<DragWidgetRoute> {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('拖动'),
      ),
      body: Column(
        children: [
          Container(
              color: Colors.green,
              height: 100,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: _top,
                    left: _left,
                    child: GestureDetector(
                      child: CircleAvatar(child: Text("A")),
                      //手指按下时会触发此回调
                      onPanDown: (DragDownDetails e) {
                        //打印手指按下的位置(相对于屏幕)
                        print("用户手指按下：${e.globalPosition}");
                      },
                      //手指滑动时会触发此回调
                      onPanUpdate: (DragUpdateDetails e) {
                        //用户手指滑动时，更新偏移，重新构建
                        setState(() {
                          _left += e.delta.dx;
                          _top += e.delta.dy;
                        });
                      },
                      onPanEnd: (DragEndDetails e) {
                        //打印滑动结束时在x、y轴上的速度
                        print(e.velocity);
                      },
                    ),
                  )
                ],
              )),
          ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: 400.0, height: 200.0),
            // TODO: 疑问使用expand报错
            // constraints: BoxConstraints.expand(),
            child: DragVertical(),
          ),
          ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: 400.0, height: 100.0),
            // constraints: BoxConstraints.expand(),
            child: ScaleWidget(),
          ),
          GestureRecognizer()
        ],
      ),
    );
  }
}

class DragVertical extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DragVerticalState();
  }
}

class _DragVerticalState extends State<DragVertical> {
  double _top = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: _top,
            child: GestureDetector(
              child: CircleAvatar(
                child: Text('A'),
              ),
              onVerticalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _top += details.delta.dy;
                });
              },
            ))
      ],
    );
  }
}

class ScaleWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScaleState();
  }

}

class _ScaleState extends State<ScaleWidget> {

  double _width = 200.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Image.asset("images/avatar.png", width: _width,),
        onScaleUpdate: (ScaleUpdateDetails details) {
          setState(() {
            _width = 200 * details.scale.clamp(.8, 10.0);
          });
        },
      ),
    );
  }

}

class GestureRecognizer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GestureRecognizerState();
  }

}

class _GestureRecognizerState extends State<GestureRecognizer> {

  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  bool _toggle = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(

        TextSpan(
            children: [
            TextSpan(text: '你好时节'),
        TextSpan(text: "点我变色",
            style: TextStyle(
                fontSize: 30.0,
                color: _toggle ? Colors.blue : Colors.red,
            ),
            recognizer: _tapGestureRecognizer
              ..onTap = () {
                setState(() {
                  _toggle = !_toggle;
                });
              }),
        TextSpan(text: '你好时节'),
        ],
      ),
    ),);
  }

}

import 'package:flutter/material.dart';

class CustomWidget extends LeafRenderObjectWidget {
  @override
  RenderObject createRenderObject(BuildContext context) {
    // TODO: implement createRenderObject
    throw UnimplementedError();
  }

  @override
  void updateRenderObject(BuildContext context, covariant RenderObject renderObject) {
    // TODO: implement updateRenderObject
    super.updateRenderObject(context, renderObject);
  }

}

class RenderCustomObject extends RenderBox{

  @override
  void performLayout() {
    // 实现布局逻辑
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    // 实现绘制
  }
}
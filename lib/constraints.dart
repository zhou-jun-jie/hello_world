import 'package:flutter/material.dart';

/// 布局类组件

Widget redBox = const DecoratedBox(decoration:
  BoxDecoration(color: Colors.red)
);

/// 有多重限制时，对于minWidth和minHeight来说，是取父子中相应数值较大的。实际上，只有这样才能保证父限制与子限制不冲突。

/// 任何时候子组件都必须遵守其父组件的约束
/// AspectRatio指定子组件的长宽比
/// LimitedBox 用于指定最大宽高
/// FractionallySizedBox 可以根据父容器宽高的百分比来设置子组件宽高
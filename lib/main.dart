import 'package:flutter/material.dart'; // 导入了Material UI组件库
//导入cupertino  widget 库
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:hello_world/Pointer.dart';
import 'package:hello_world/drag.dart';
import 'package:hello_world/gesture.dart';
import 'package:hello_world/grid.dart';
import 'package:hello_world/scrolnotification.dart';
import 'scollcontroller.dart';

import 'scroll.dart';

void main() {
  // 开启控件视图
  // debugPaintSizeEnabled = true;
  // 应用入口
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // 应用名称
      title: 'Flutter Demo',
      // 应用首页路由
      home: AndroidTestRoute(),

      /// TODO 路由有问题
      /*routes: {
        "new_route": context => NewRoute(),
      }*/
    );

    return const CupertinoApp(
      // 应用名称
      title: 'Flutter Demo',
      // 应用首页路由
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// StatefulWidget 是一个有状态的组件,无状态的组件（Stateless widget）
class MyHomePage extends StatefulWidget {
  static final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    debugPrint("initState");
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      key: MyHomePage._globalKey,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                onPressed: () {
                  /*// 查找父级最近的Scaffold对应的ScaffoldState对象
              // ScaffoldState _state = context.findAncestorStateOfType<ScaffoldState>()!;
              ScaffoldState _state = Scaffold.of(context);
              // 打开抽屉菜单
              _state.openDrawer();*/

                  /// 通过GlobalKey来获取State对象
                  /// TODO 使用 GlobalKey 开销较大，如果有其他可选方案，应尽量避免使用它。
                  /// 另外，同一个 GlobalKey 在整个 widget 树中必须是唯一的，不能重复。
                  MyHomePage._globalKey.currentState?.openDrawer();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("我是SnackBar")),
                  );
                },
                child: const Text("test")),
            const Text(
              'You have clicked the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  /// TODO 这个方法并不会走
  /// 调用widget.canUpdate来检测 widget
  /// 新旧 widget 的key和runtimeType同时相等时didUpdateWidget()就会被调用
  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    print("didUpdateWidget");
  }

  ///当 State 对象从树中被移除时，会调用此回调
  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  /// 此回调是专门为了开发调试而提供的，在热重载(hot reload)时会被调用，
  /// 此回调在Release模式下永远不会被调用。
  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  ///当系统语言 Locale 或应用主题改变时，Flutter 框架会通知 widget 调用此回调
  ///组件第一次被创建后挂载的时候（包括重创建）对应的didChangeDependencies也会被调用
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}

/// android风格组件
class AndroidTestRoute extends StatelessWidget {
  const AndroidTestRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Matiral Demo"),
      ),
      body: Center(
        child: ElevatedButton(
            child: const Text("Press"),
            onPressed: () {
              debugDumpApp();
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const RouterTestRoute();
              }));
            }),
      ),
    );
  }
}

/// ios风格组件
class CupertinoTestRoute extends StatelessWidget {
  const CupertinoTestRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Cupertino Demo"),
      ),
      child: Center(
        child: CupertinoButton(
            color: CupertinoColors.activeBlue,
            child: const Text("Press"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const NewRoute();
                // return const RouterTestRoute();
              }));
            }),
      ),
    );
  }
}

class RouterTestRoute extends StatelessWidget {
  const RouterTestRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RouterTestRoute"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            var result = await Navigator.push(context,
                MaterialPageRoute(builder: (context) {
              return const TipRoute(text: "我是提示xxx");
            }));
            print("路由返回值:$result");
          },
          child: const Text("打开提示页"),
        ),
      ),
    );
  }
}

/// 路由
class NewRoute extends StatelessWidget {
  const NewRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("New Route"),
      ),
      child: Center(
        child: Text(
          "This is new route",
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}

/// 带参数的路由
class TipRoute extends StatelessWidget {
  const TipRoute({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("提示"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: [
              // Text(
              //   text * 10,
              //   textAlign: TextAlign.center,
              //   maxLines: 1,
              //   overflow: TextOverflow.ellipsis,
              //   textScaleFactor: 2.0,
              // ),
              // ElevatedButton(
              //     onPressed: () => Navigator.pop(context, "我是返回值"),
              //     child: const Text("返回")),
              // const Text.rich(TextSpan(children: [
              //   TextSpan(text: "Baidu:"),
              //   TextSpan(
              //       text: "https://www.baidu.com",
              //       style: TextStyle(
              //         color: Colors.blue,
              //         fontFamily: 'Raleway',
              //
              //         // fontStyle: FontStyle.italic
              //         // fontFamily: 'Raleway',
              //         // package: 'awesome_package',
              //       ))
              // ])),
              // // ElevatedButton(
              //     onPressed: () => {}, child: const Text("ElevatedButton")),
              // ElevatedButton.icon(
              //     onPressed: null,
              //     icon: const Icon(Icons.send),
              //     label: const Text("发送")),
              // TextButton(onPressed: () => {}, child: const Text("TextButton")),
              // OutlinedButton(
              //     onPressed: () => {}, child: const Text("OutlinedButton")),
              // IconButton(
              //     onPressed: () => {}, icon: const Icon(Icons.thumb_down)),

              /// 本地图片
              // const Image(
              //   image: AssetImage("images/avatar.png"),
              //   width: 100.0,
              // ),
              /*Image.network(
                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                width: 100.0,
                color: Colors.blue,
                colorBlendMode: BlendMode.difference,
                repeat: ImageRepeat.repeatY,
              ),*/
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: const [
              //     Icon(Icons.accessible, color: Colors.green),
              //     Icon(Icons.error, color: Colors.green),
              //     Icon(Icons.fingerprint, color: Colors.green),
              //   ],
              // ),
              // const SwitchAnaCheckBoxTestRoute(),
              /*// 焦点
              const FocusTestRoute()*/
              // Form && FormField
              // 表单
              // const FormTestState()
              // Flex
              // FlexLayoutTestRoute(),
              // TextButton(
              //     onPressed: () => {
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) =>
              //                     /*SingleChildScrollViewTestRoute(),*/
              //                 /*ScrollControllerTestRoute(),*/
              //                 /*ScrollNotificationTestRoute(),*/
              //                 GridViewRoute(),
              //               ))
              //         },
              //     child: const Text(
              //       '跳转Scroll')
              //     ),
              // PointerWidget(),
              // GestureWidget(),
              ElevatedButton(
                  onPressed: () =>
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                        return DragWidgetRoute();
                      })),
                  child: Text('拖动'))
            ],
          ),
        ),
      ),
    );
  }
}

/// Form表单
class FormTestState extends StatefulWidget {
  const FormTestState({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FormTestState();
  }
}

class _FormTestState extends State<FormTestState> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            autofocus: true,
            controller: _nameController,
            decoration: const InputDecoration(
                labelText: "用户名", hintText: "用户名或邮箱", icon: Icon(Icons.person)),
            // 校验用户名
            validator: (v) {
              return v!.trim().isNotEmpty ? null : "用户名不能为空";
            },
          ),
          TextFormField(
            controller: _pwdController,
            decoration: const InputDecoration(
                labelText: "密码", hintText: "您的登录密码", icon: Icon(Icons.lock)),
            obscureText: true,
            validator: (v) {
              return v!.trim().length > 5 ? null : "密码不能少于6位";
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text("登录"),
                  ),
                  onPressed: () {
                    if ((_formKey.currentState as FormState).validate()) {
                      debugPrint("验证通过,提交数据");
                    }
                  },
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

/// 输入框焦点控制
class FocusTestRoute extends StatefulWidget {
  const FocusTestRoute({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FocusTestRouteState();
  }
}

class _FocusTestRouteState extends State<FocusTestRoute> {
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();

  FocusScopeNode? focusScopeNode;

  @override
  Widget build(BuildContext context) {
    focusNode2.addListener(() {
      print(focusNode2.hasFocus);
    });

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            autofocus: true,
            focusNode: focusNode1,
            decoration: const InputDecoration(
                labelText: "input1",
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue))),
          ),
          TextField(
            focusNode: focusNode2,
            decoration: const InputDecoration(labelText: "input2"),
          ),
          Builder(builder: (context) {
            return Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      focusScopeNode ??= FocusScope.of(context);
                      focusScopeNode?.requestFocus(focusNode2);
                    },
                    child: const Text("移动焦点")),
                ElevatedButton(
                  child: const Text("隐藏键盘"),
                  onPressed: () {
                    // 当所有编辑框都失去焦点时键盘就会收起
                    focusNode1.unfocus();
                    focusNode2.unfocus();
                  },
                ),
              ],
            );
          })
        ],
      ),
    );
  }
}

/// 复选框
class SwitchAnaCheckBoxTestRoute extends StatefulWidget {
  const SwitchAnaCheckBoxTestRoute({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SwitchAndCheckBoxTestRouteState();
  }
}

/// 需要父组件来管理状态
class _SwitchAndCheckBoxTestRouteState
    extends State<SwitchAnaCheckBoxTestRoute> {
  bool _switchChecked = true; //单选
  bool _checkboxSelected = true; //复选框

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Switch只能定义宽度，高度也是固定的。
        Switch(
            value: _switchChecked,
            onChanged: (value) {
              setState(() {
                _switchChecked = value;
              });
            }),

        /// Checkbox的大小是固定的，无法自定义
        Checkbox(
            value: _checkboxSelected,
            activeColor: Colors.red,
            onChanged: (value) {
              setState(() {
                _checkboxSelected = value!;
              });
            })
      ],
    );
  }
}

///-----------------------------------------------分割线-----------------------------------------------
class TapboxA extends StatefulWidget {
  const TapboxA({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TapboxAState();
  }
}

class _TapboxAState extends State {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
        child: Center(
          child: Text(
            _active ? "Active" : "Inactive",
            style: const TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

/// 父widget管理tapBox的状态
class ParentWidget extends StatefulWidget {
  const ParentWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ParentWidgetState();
  }
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TapboxBWidget(
      active: _active,
      onChanged: _handleTapboxChanged,
    );
  }
}

class TapboxBWidget extends StatelessWidget {
  const TapboxBWidget({Key? key, this.active = false, required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class FlexLayoutTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //Flex的两个子widget按1：2来占据水平空间
        Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: 30.0,
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 30.0,
                color: Colors.green,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SizedBox(
            height: 100.0,
            //Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 30.0,
                    color: Colors.red,
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30.0,
                    color: Colors.green,
                  ),
                ),
                Wrap(
                  spacing: 50.0,
                  runSpacing: 4.0,
                  alignment: WrapAlignment.center,
                  children: const [
                    Chip(
                      label: Text("Hamilton"),
                      avatar: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text('A'),
                      ),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue, child: Text('M')),
                      label: Text('Lafayette'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue, child: Text('H')),
                      label: Text('Mulligan'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue, child: Text('J')),
                      label: Text('Laurens'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

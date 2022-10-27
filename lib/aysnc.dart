/// 异步支持

/// 1. Future

main() {
  // futureDemo1();
  // futureDemo2();
  // futureDemo3();

  task();
}

Future<String>? futureDemo1() {
  Future.delayed(Duration(seconds: 2), () {
    return "hi world";
  }).then((value) {
    print(value);
  });
}

Future<String>? futureDemo2() {
  Future.delayed(Duration(seconds: 2), () {
    // throw ArgumentError("test null exception");
    return "Demo2";
  })

  /// then第二个可选参数是异常,也可以将catchError替换成onError
      .then((value) {
        print(value);
      })
      .catchError((e) {
    print(e);
  })
      .whenComplete(() => print("无论成功或者失败都会走这里"));
}

Future<String>? futureDemo3() {
  Future.wait([
    Future.delayed(Duration(seconds: 2), () {
      return "Hello";
    }),
    Future.delayed(Duration(seconds: 4), () {
      return "world";
    })
  ]).then((value) {
    print(value[0] + value[1]);
  });
}


/// TODO 消除回调地狱
/// 2. async/wait 异步任务串行化,防止回调地狱
/// 方式一: 使用Future消除Callback Hell
/// 方式二: 使用async/await 消除Callback Hell
task() async {
  // String demo1 = await futureDemo1();
  // print(demo1);
  // String demo2 = await futureDemo2();
  // print(demo2);
  // String demo3 = await futureDemo3();
  // print(demo3);
}




main() {
  test(() => true);

  say("hi world");

  execute(() => print("xxx"));

  print(say2("kevin", "hello"));
  print(say2("kevin", "hello", "phone"));

  enableFlags(bold: true, hidden: false);
}

/// 函数声明
typedef bool CALLBACK();

// 不指定返回类型，此时默认为dynamic，不是bool
// isNoble(int atomicNumber) {
//   return _nobleGases[atomicNumber] != null;
// }

void test(CALLBACK cb) {
  print(cb());
}

/// 函数作为变量
var say = (str) {
  print(str);
};

/// 函数作为参数传递
void execute(var callback) {
  callback();
}

/// TODO 注意: 不能同时使用可选的位置参数和可选的命名参数。

/// 1 可选位置的参数
String say2(String from, String msg, [String? device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

/// 2 可选的命名参数
/// TODO 注意: 不使用required 会报错 , required的含义是什么
void enableFlags({required bool bold, required bool hidden}) {}

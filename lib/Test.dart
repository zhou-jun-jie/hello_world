dynamic a;
Object b = "";


// const 变量是一个编译时常量（编译时直接替换为常量值），
const str1 = "hi world";
// final变量在第一次使用时被初始化。
final str = "hi world";


main() {
  a = "";
  printLengths();
}

printLengths() {

  print(a.length);
  // 报错 The getter 'length' is not defined for the class 'Object'
  // print(b.length);

  // a是字符串，没有"xx"属性，编译时不会报错，运行时会报错
  print(a.xx);

}

// 空安全
// test() {
//   int i;
//   print(i*8);
// }

int i = 8;
int? j;
late int k;
test2() {
  k = 10;
  if (j != null) {
    print(j);
  }
}

class Test{
  int? i;
  Function? fun;
  say(){
    if(i!=null) {
      print(i! * 8); //因为已经判过空，所以能走到这 i 必不为null，如果没有显式申明，则 IDE 会报错
    }
    if(fun!=null){
      fun!(); // 同上
    }
  }

}
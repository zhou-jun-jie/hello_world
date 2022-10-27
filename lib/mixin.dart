/// 多继承

class Person {
  say() {
    print("say");
  }
}

mixin Eat {
  eat() {
    print('eat');
  }
}

mixin Walk {
  walk() {
    print("work");
  }
}

mixin Code {
  code() {
    print("code");
  }

  walk() {
    print("code__walk");
  }
}

class Dog with Eat, Walk {}

///如果多个mixin 中有同名方法，with 时，会默认使用最后面的 mixin 的，
///mixin 方法中可以通过 super 关键字调用之前 mixin 或类中的方法。
class Man extends Person with Eat, Walk, Code {}

main() {

  var man = Man();
  man.walk();
  man.code();

}

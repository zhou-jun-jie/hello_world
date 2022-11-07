// 订阅者回调签名
typedef void EventCallback(arg);

class EventBus {
  // 私有构造函数
  EventBus._internal();

  // 保存单例
  static EventBus _singleton = EventBus._internal();

  // 返回单例(工厂构造函数)
  factory EventBus() => _singleton;

  // 保存事件订阅者队列
  final _emap = Map<Object,List<EventCallback>?>();

  // 添加订阅者
  void on(eventName,EventCallback e) {
    _emap[eventName] ??= <EventCallback>[];
    _emap[eventName]!.add(e);
  }

  // 移除订阅者 TODO: 语法疑问: [EventCallback? e] 和 [arg] 的区别是什么
  void off(eventName,[EventCallback? e]) {
    var list = _emap[eventName];
    if (eventName == null || list == null) return;
    if (e == null) {
      _emap[eventName] = null;
    } else {
      list.remove(e);
    }
  }

  // 触发事件
  void emit(eventName,[arg]) {
    var list = _emap[eventName];
    if (list == null) return;
    int len = list.length -1 ;
    for (var i = len ; i>-1 ;--i) {
      list[i](arg);
    }
  }

}


var bus = EventBus();

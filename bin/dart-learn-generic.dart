//part of 'dart-learn.dart';
part of 'dart-learn.dart';

void main(){
  var list = <String>['','',''];
  querySelector('');
}

abstract class Cache<E>{
  E getCache(String name);
}

class IntegerCache implements Cache<int>{
  int getCache(String name){
    return 0;
  }
}

class ListUtil{
  T first<T>(List<T> list){
    return list != null && list.length  > 0 ? list[0] : null;
  }
}

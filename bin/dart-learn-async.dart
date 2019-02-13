import 'dart:async';
import 'dart:math';
void main() async {
  List<Future<int>> futures = [];
  futures.add(asyncFunc());
  futures.add(asyncFunc());
  futures.add(asyncFunc());
  var stream = Stream.fromFutures(futures);

  print("wait for futures...");
  /*await for(var i in stream){
    print(i);
  }*/
  stream.listen((i)=>print(i));
  print('exit');
}

Future<int> asyncFunc() async{
  await 1;
  int i = 0;
  for(;i < 1000000000;i++){
    var a = i - 2;
    if( a % 2 == 4){
      print('hehe');
    }
  }
  print('async func');
  return i;
}
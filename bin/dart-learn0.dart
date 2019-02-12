
void main() {
  print((2<<62) - 1);
  print((2<<62) - 2);

  print(10/3);
  print((-2<<62));

  print(0xf);

  print(1.2e5);

  var num = 0/0;
  print(num.isNaN);

}

class A{
  static String getString(String a,String b){
    return a + b;
  }

  void printThis(){
      print(this);
      print(this.runtimeType);
      print(null.runtimeType);
  }

}
abstract class C{
  void ok();
}

class B extends A implements C{
  void ok(){

  }
}



void main(){
  new C().printSelf();
  new C().printSelf();
}



class A{
  A(){
    print('init A');
  }
}


class B{
  var c = new A();
  void printSelf(){
    print(this);
  }
}

class C with B{

}



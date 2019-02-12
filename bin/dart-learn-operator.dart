

void main(){
  var a = Object();
  a = null;
  print(a?.hashCode);

}

class A{
  int _b = 10;
  int get hashCode{
    print("invoke A -> hashCode");
    return 11;
  }

  bool operator ==(dynamic other){
    if(other == null){
      return false;
    }
    return this.hashCode == other.hashCode;
  }
}
typedef int Compare(Object a,Object b);

void main(){

  var sortedCollection = new SortedCollection((a,b)=>0);

  print(sortedCollection.compare.runtimeType);

  print(sortedCollection.compare is Function);

  print(sortedCollection.compare is Compare);

  sortedCollection.a().then((e)=>
    print(e)
  );
}

class SortedCollection{
  Function compare;

  SortedCollection(int f(Object a,Object b)){
    compare = f;
  }

  Future<int> a()async{
    return 15;
  }
}
int a = 1;
String str = "this is a string";
void main(){

  print(a);

  print("a is $a");
  
  print("string : $str");

  print("string to upper case : ${str.toUpperCase()}");

  assert('string one' 'string two' ==
      'string one' + 'string two');

  String multiLine = '''
    you can careate multi-line strings
    just like this one
  ''';
  print(multiLine);


  String multiLine2 = """ 
    this is also 
    a multi-line strings
  """;
  print(multiLine2);

  var s = r'row string : \n has not a special treatment';
  print(s);
}
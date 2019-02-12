void main(){
  var smile = '\u{1f600}';//smile emoji

  var heart = '\u2665';

  var str = "方易明";

  print(smile);
  print(heart);

  print(smile.codeUnitAt(0));
  print(smile.codeUnitAt(1));
  print(smile.codeUnits);

  print(smile.runes.toList());

  print(null);

  print(heart.codeUnitAt(0));
  print(heart.codeUnits);
  print(heart.runes.toList());

  print(null);
  print(str.codeUnits);
  print(str.codeUnitAt(0));
  print(str.runes.toList());

}
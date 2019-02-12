void main(){
  var map = {
    'first' : "public",
    'second' : "proteced",
    'third' : "private"
  };
  map.forEach((key,value)=>
      print('key : $key     value : $value')
  );
}
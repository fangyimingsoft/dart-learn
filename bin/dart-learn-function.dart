/**
 * 入口函数:每个应用需要一个顶级main函数才能执行,main有个可选的List<String>参数用来接收命令行参数
 * ..可以多次调用一个对象的多个方法
 *
 */
Function aFunc = (int b){
  int num = 0;
    return (){
      return num++;
    };
};

void main(){

  /**
   * 可选命名参数调用
   */
  var a = FunctionDefine().func4(1, 2,c : 2);
  var b = FunctionDefine().func5(1, 2,c : 2,d : 3);
  var c = FunctionDefine().func6(1, 2,c : 2);
  print("a : $a , b : $b , c : $c");


  /**
   * 可选位置参数调用
   */
  var a1 = FunctionDefine().func7(1,2);
  var a2 = FunctionDefine().func7(1,2,3);
  print("a1 : $a1 , a2 : $a2");


  /**
   * 匿名函数(又称lambda或者closure闭包)
   *
   */
  Function noneName = (int a ,int b,{int c = 0}){

  };
}
/**
 * 方法可以有两种类型的参数,[必须的]和[可选的]
 * [必须的]在参数列表前面,后面是[可选的]参数,
 * 其中,[可选的]参数可以是[命名参数]或[基于位置]的参数,但是这两种不能同时当做可选参数
 *
 */
class FunctionDefine{

  void func1(param){//忽略类型定义
    print(param.runtimeType);
  }

  void func2(int param){//定义参数类型
    print(param);
  }

  int func3(int a,int b) => a + b;//只有一个表达式,可以使用语法缩写

  /**
   * 1）定义方法时,使用{type value,type value}定义可选参数,当没有传入可选参数时,value的类型为Null,值为null
   */
  int func4(int a,int b,{int c,int d}) => a + b + (c != null ? c : 0) + (d != null ? d : 0);

  /**
   * 2）使用{value : type,value : type}定义可选参数时,当没有传入这个可选参数,value的类型为Type,值为int
   */
  int func5(int a,int b,{c : int,d : int}) => a + b + (c != null ? c : 0) + (d != null ? d : 0);


  int func6(int a,int b,{c : int,int d}) => a + b + (c != null ? c : 0) + (d != null ? d : 0);

  /**
   * 3）定义位置参数,使用[type value,type value]定义
   */
  int func7(int a ,[int b,int c]){
    return a + (b != null ? b : 0) + (c != null ? c : 0);
  }

  /**
   * 4）可选参数的默认值设置，使用 = 给可选参数设置默认值，参数值必须是常量
   */
  int func8(int a,[int b = 0,int c = 0]){
    return a + b + c;
  }

  int func9(int a ,{int b = 0,int c = 0}) => a + b + c;

}


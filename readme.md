# [dart学习](http://dart.goodev.org/guides/language/language-tour):
>### 1.dart核心概念:
#### 1)**所有变量**的值都是**对象**,数字、函数、null,所有对象都继承自Object

#### 2)dart是**强类型**语言,可以使用var声明变量,dart会推导出变量类型,当类型值不确定时,可以使用dynamic声明变量(我理解的使用dynamic等同于Object声明变量)

#### 3)dart支持顶级函数,(像main()),函数也可以依赖于类(静态函数)或者对象(对象中的函数)

#### 4)同样的,dart支持顶级变量,依赖于类或者对象

#### 5)和Java不一样,Dart没有public protected private关键字,如果一个变量以_(下划线)开始,那么这个变量就是这个library私有的


>###2.语言特点
####1)未初始化的变量值为null
```
    int a;
    print(a); => null;
```

####2)

>###3.语法和关键字
####final:
#####1.final声明的变量无法重新赋值。
#####2.final声明变量可以省略声明变量类型(final无法和var一起使用)

####const:
#####1.可以用来声明一个常量(无法和var一起使用,可以省略变量类型)
#####2.在编译时确定值***
#####3.可以使用数字或字符串字面量、const变量或者常量数字算术运算的结果
#####4.const还可以用来创建常量值
```
var a = const [];  //a不是常量,a的值是常量
const b = [];           //b是常量,b的值不是常量
const c = const [];     //c是常量,c的值也是常量
```
>###4.内置类型
####Dart语言对以下类型有特殊的支持:
```
numbers
strings
booleans
lists (also known as arrays)
maps
runes (for expressing Unicode characters in a string)
symbols
```
```
numbers:    
int
double

strings:
//dart的String是utf-16编码的一个队列
String str = 'this is a string';
String str2 = "this is also a string";

runes:
//dart中的runes是utf-32字符集的String对象
```

>###5.Function

Dart是一个真正的面向对象的语言,方法也是对象并且具有一种类型,Function。也就是说，方法可以赋值给变量，也可以当做其他方法的参数。（也可以把Dart类的实例当做方法来调用）

方法可以有两种类型的参数,[必须的]和[可选的]

[必须的]在参数列表前面,后面是[可选的]参数,其中,[可选的]参数可以是[命名参数]或[基于位置]的参数,但是这两种不能同时当做可选参数

所有函数都有一个返回值。如果没有指定返回值，则默认把return null作为函数的最后一个语句执行。
#####1）定义方法时,使用{type value,type value}定义可选参数,当没有传入可选参数时,value的类型为Null,值为null
```
int func4(int a,int b,{int c,int d}) => a + b + (c != null ? c : 0) + (d != null ? d : 0);
```

#####2）使用{value : type,value : type}定义可选参数时,当没有传入这个可选参数,value的类型为Type,值为int
```
int func5(int a,int b,{c : int,d : int}) => a + b + (c != null ? c : 0) + (d != null ? d : 0);

int func6(int a,int b,{c : int,int d}) => a + b + (c != null ? c : 0) + (d != null ? d : 0);
```

####3）定义位置参数,使用[type value,type value]定义
```
int func7(int a ,[int b,int c]){
    return a + (b != null ? b : 0) + (c != null ? c : 0);
}
```

####4）可选参数的默认值设置，使用 = 给可选参数设置默认值，参数值必须是常量
```
int func8(int a,[int b = 0,int c = 0]){
    return a + b + c;
}
int func9(int a ,{int b = 0,int c = 0}) => a + b + c;
```

####5）调用方法
```
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
```

>###6操作符
####特殊操作符
```
    ~/  是除号,但是返回值为整数
    ==  默认比较的是两个对象引用是否相等(使用identical()方法比较两个对象是否是同一个对象)
    ??= 
        a = 1;
        b ??= value;//如果b是null,则赋值给b,如果b不是null,则b的值保持不变
    ??(expr1 ? expr2)
        如果expr1是non-null则返回其值,否则执行expr2并返回其结果
    ..  级联操作符,可以在同一个对象上连续调用多个函数以及访问成员变量
        querySelector('#button')
            ..text = 'hello dart'
            ..classes.add('light-button')
            ..onClick = ()=>{print('click')};
    ?.  条件成员访问
        var a = new Object();
        a = null;
        print(a?.hashCode);//如果a为null则返回null,否则返回hashCode成员
        
        a?.field = 1;//如果a为null则不赋值,否则赋值给a.field
        
        
        
        
```

####类型判定操作符:
```
    as  类型转换
    is  如果指定的对象则返回true
    is! 如果不是指定的对象则返回true
```

>###7.异常

和Java不同,所有Dart异常是***非检查异常***。方法不一定声明了他们所抛出的异常，并且你不要求捕获任何异常。  
Dart提供Exception和Error类型，以及一些子类型。但是Dart代码可以抛出任何非null对象为异常，不仅仅是实现了Exception或Error的对象。
```
throw :
    throw new FormatException('error');
    还可以抛出任意的对象
    throw 'Out of llams!';
    
catch :
    try{
        functionInvoke();
    }on OutofLlamasException(){//处理OutofLlamasException异常
        //...
    }on Exception catch(e){//处理并捕获Exception异常
        //...
    }catch(e){//没有指定异常类型,处理并捕获所有异常
       //...
    }
    catch可以带有一个或者两个参数,第一个参数为抛出的异常对象,第二个参数为堆栈信息(一个StackTrace对象)
    
finally :
    确保某些代码执行,可以使用finally代码块实现,如果没有catch语句来捕获异常,则执行完finally语句后,异常被抛出,定义的finally语句在匹配的catch语句之后执行
    try{
        functionInvoke();
    }on Exception catch(e){
        //...
    }finally{
        //...
    }
    
```
使用关键字rethrow可以将捕获的异常重新抛出

>###8.Classes
####1.特点
+ 单继承
+ 所有类的父类是Object
+ 使用new和构造函数创建对象,构造函数可以是ClassName或ClassName.identifier
```
例:
    class Point{
      int p1;
      int p2;
      Point(int p1,int p2){
        this.p1 = p1;
        this.p2 = p2;
      }
    
      Point.getPoint(this.p1,this.p2);//命名构造函数
    }
    //
    new Point(1,2);
    new Point.getPoint(1,2);
```

####2.语法

+ 类成员

   1. 所有没有初始化的成员变量值都为null

   2. 每个实例变量都会自动生成一个getter方法(隐含的),non-final的实例变量还会自动生成一个setter方法

   3. 在定义实例化变量时初始化,赋值操作是在构造函数和初始化参数列表执行之前完成的。

+ 构造函数

   1. Dart提供一个语法糖简化编写构造函数
      ```
        class Point{
          int p1 = 1;
          int p2;//default null
          Point(this.p1,this.p2);
        }
        
        等同于:
        
        class Point{
          int p1 = 1;
          int p2;//default null
          Point(int p1,int p2){
            this.p1 = p1;
            this.p2 = p2;
          }
        }
      ```

   2. 默认构造函数：
   
      如果没有定义默认的构造函数，Dart会默认提供一个无参的构造函数，并且这个构造函数会调用父类无参的构造函数。

   3. 命名构造函数：

      使用命名构造函数可以更清晰的表达构造函数的意图
      ```
       class Point{
         int p1 = 1;
         int p2;//default null
         
         Point(this.p1;this.p2);
         
         Point.getPoint(this.p1,this.p2);//命名构造函数
       } 
       ```
+ 构造函数的执行顺序:
   1. 初始化参数列表
         
   2. 超类的无参构造函数
   
   3. 主类的无参构造函数

+ 如果超类没有无名无参构造函数,可以手工调用超类其他构造函数。在构造函数参数后使用冒号（:）可以调用：
   ```
   class Employee extends Person{
   
     int num;
   
     int num2;
   
     Employee() : super.fromJson({}){
   
     }
   
     Employee.fromJson2(String name,int age) 
          : num = 1,
            num2 = 2,
            super.fromJson({}){
     }//初始化列表,可以用来初始化实例参数(等号右边不能访问this)
   }
    ```
+ 重定向构造函数

   有时候需要在构造函数中调用这个类的其他构造函数
   ```
    class Employee extends Person{
      final int num;
      int num2;
      Employee() : num = 1,super.fromJson({}){
    
      }
      Employee.fromJson2(String name,int age) : this();//重定向构造函数
    }
    ```

+ 常量构造函数
   
   如果你的类提供一个状态不变的对象,可以把这个对象定义为编译时常量。实现这个功能，需要定义一个const构造函数，并且所有类的变量都为final
   ```
    class Person{
      final String firstName;
      
      const Person(this.firstName);
    
      static Person p = const Person('fangyiming');//声明一个常量对象
    }
    ```

+ 工厂方法构造函数

   如果一个构造函数不总是返回一个新的对象,此时你可以使用工厂方法构造函数,可以手动控制返回的对象(无法访问this)
   ```
   class Logger{
   
     String name;
   
     static final Map<String,Logger> _cache = {};
   
     Logger._newLogger(this.name);
   
     factory Logger(String name){//工厂方法构造函数
       if(_cache.containsKey(name)){
         return _cache[name];
       }
       return Logger._newLogger(name);
     }
   }
    ```
+ 函数(Methods)
   1. Getter和Setter
      
      每个实例变量都有一个隐含的getter,非final的变量则还有一个setter。可以通过实现getter和setter来创建新的属性。
      ```
        class Calculator{
          int result;
          int number;
          int get rotate => result~/number;//定义rotate的getter,用来获取两个数之间的倍率
              set rotate(int rotate) => result = number * rotate;//定义rotate的setter,用来设置两个数之间的倍率
        
          Calculator(this.result,this.number);
        }
      ```  
   2. Abstract methods(抽象函数)
      
      实例函数、getter、setter可以为抽象函数，抽象函数只能在抽象类中定义。
   
   3. 复写操作符
      ```
        class A{
        
          String name;
        
          A(this.name);
        
          A operator +(A a){
            print(' : ${this}');
            print(' : $a');
            return A(this.name + ' ' + (a?.name == null ? '' : a.name));
          }
        }
      ```
      
+ 类
   1. AbstractClasses(抽象类)
   
      使用abstract修饰符定义一个抽象类,抽象类无法被实例化,如果你希望你的抽象类被实例化,创建一个工厂构造函数。
   
   2. 隐式接口（implicit interfaces）
   
      每个类都隐式的定义了一个包含所有实例成员的接口， 并且这个类实现了这个接口。如果你想 创建类 A 来支持 类 B 的 api，而不想继承 B 的实现， 则类 A 应该实现 B 的接口。   
      ```
        void main(){
          print(greetBob(new Person('fangyiming')));
          print(greetBob(new Imposter('fangle')));
        }
        
        String greetBob(Person p){
          return p.greet('bob');
        }
        
        class Person{
          final String _name;
        
          Person(this._name);
        
          String greet(String who) => 'Hello,$who. i am $_name';
        }
        
        class Imposter implements Person{
        
          String  _name;
        
          Imposter(this._name);
        
          String greet(String who) => 'Hello,$who. i am $_name';
        }
        输出:
        Hello,bob. i am fangyiming
        Hello,bob. i am fangle

      ```
     
   3. 扩展类(Extending classes)
   
      1. noSuchMethod
      
         子类可以覆写实例函数，getter 和 setter。 如果调用了对象上不存在的函数，则就会触发 noSuchMethod() 函 数。
      2. call
      3. 为类添加新的功能
         
         使用mixins可以为类添加新的功能。mixins是一种在多类继承中重用一个类代码的方法。使用with关键字,后面是一个或多个mixin：
         ```
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
            //输出
            init A
            Instance of 'C'
            init A
            Instance of 'C'
         ```
         1. mixin只能继承Object
         2. mixin没有显式构造函数
         3. mixin不能调用super
         
         经测试,每次实例化一个使用了mixins的类,都会实例化这个类使用的mixins类(类似多重继承,会实例化多个父类)。   
     
   4. 枚举类型(Enumerated types)
   
      定义一个枚举类型
      ```
        enum Color{
            red,
            green,
            blue
        }
        
        //可以使用枚举类型的values获取所有值
        var values = Color.values;
        
        //枚举类型的每个值都有一个index的getter函数,函数返回该值在枚举类型定义中的位置(从0开始)。
        assert(Color.red == 0);
        assert(Color.green == 1);
        assert(Color.blue == 2);
      ```
      枚举类型在switch中使用时(可以给switch传入null值),如果没有处理所有枚举类型的值,会抛出一个警告。
   
+ 泛型
    ```
    abstract class Cache<E>{
      E getCache(String name);
    }
    
    class IntegerCache implements Cache<int>{
      int getCache(String name){
        return 0;
      }
    }
    ```          
    
    使用集合字面量：
    ```
    var names = <String>['Bob','Jack','Ma'];
    var pages = <String,String>{
        'index.html' : 'homePage'
    };
    
    //检查集合类型
    print(names is List<String>);
    //这种类型只判断集合的类型,并不能保证集合中每个元素的类型
    ```
    
    可以使用extends限制泛型类型
    ```
    class Cache<E extends Person>{
        //...
    }
    ```
    
    使用泛型函数：
    ```
    class ListUtil{
      T first<T>(List<T> list){
        return list != null && list.length  > 0 ? list[0] : null;
      }
    }
    //first<T>标记这个函数是一个泛型函数,可以在返回值类型、参数类型、局部变量中使用泛型T
    ```
    
>###9.库和可见性

    
    
    
    




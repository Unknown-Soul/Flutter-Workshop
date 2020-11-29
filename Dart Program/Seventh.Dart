// Functions

main() {
  List<int> arr = [10, 20, 30];
  int result = add(20, 30);
  print(result);
  result = adder(30, 30);
  print(result);
  String result1 = adder("Amit", "sham");
  print(result1);
  // Anonymous Function
  // we can pass one function into onther function
  // problem :: they are global
  var w = () {
    print("W is a variable finction");
  };
  print(w);
  w();

  Function x = () {
    print("x is also a variable finction");
    return 1000;
  };
  print(
      x); // Closure: () => int tell us what we are retiuning , if nothing is return nothing it will be  Closure: () => Null
  print("Runtime is ${x.runtimeType}");
  x();
  print("lambda  function vall ${add2(2, 3)}");
}

// Function Declaration
int add(int x, int y) {
  return x + y;
}

adder(x, y) {
  return x + y;
}

// lambda or shorthand or FatArrow function
var add2 = (x, y) => x + y;

main() {
  List<int> arr = [10, 20, 30, 40];
  //iterator
  for (int i in arr) {
    print(i);
  }
  print("loop");
  //loop
  for (int i = 0; i < arr.length; i++) {
    print(arr[i]);
  }
  //foreach
  // passing function printit in inbuilt forEach function
  arr.forEach(printit);

  arr.forEach((ele) {
    print("Element in same function $ele");
  });

  arr.forEach((ele) => print(ele));
}

printit(ele) {
  print("Element is $ele");
}

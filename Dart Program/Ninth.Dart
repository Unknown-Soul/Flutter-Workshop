main() {
  List<int> list = [1, 23, 22, 2, 19, 23, 23, 34, 45];
  list.forEach((ele) => print(ele));
  List<int> sublist = list.sublist(1, 4);
  print("SUblist is  $sublist");
  Iterable<int> itr = list.skip(2);
  itr.forEach((element) {
    print("Element is $element wihtout list till index 2 element");
  });

  list.skip(3).forEach((element) => print(element));
  //join
  String str = list.join("-"); // return string
  print("Join $str");
  //sort
  list.sort((a, b) => a - b); // we need to priovide logic for sorting
  print("sorting list $list");

  var name = ["name", "ashu", "om", "zebra"];
  name.sort((a, b) => a.compareTo(b)); //Descending
  print(name);
  name.sort((a, b) => b.compareTo(a)); // Ascending
  print(name);

  bool result = name.every((name) => name.contains("b"));
  print(result);
/*
  error
  name
      .where((name) => name.startsWith("A"))
      .forEach((element) => print(element));

  var x1 = name.firstWhere((name) => name.startsWith("A"));
  print("First one $x1");*/
  var y = [2, 3, 2, 4];
  print("fold_____");
  var result1 = y.fold(0, (previousValue, element) => previousValue + element);
  print(result1);

  //properties
  print(list.length);
  print(list.isEmpty);
  print(list.isNotEmpty);
  print(list.first);
}

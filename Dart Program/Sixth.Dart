// Advcance datatype

main() {
  var arr = [10, 20, 40, 23]; // [] defining list
  List list1 = [10, 20, 30, 23];
  var a = [10, "Amit", 30];
  List<String> ls = ["Amuit", "Ram", "SHam"];
  var m = [12, 34, 453]; // implicit way
  List<int> list = [19, 20, 30]; // Explicit way
  int e = list[0]; //Access
  list[1] = 10000; // update
  print(list); // internally lsit is converted to String
  print(list.toString());
  list.add(21); // insert at last
  list.insert(1, 34);
  var index = list.indexOf(34);
  print(index);
  index = list.lastIndexOf(34); // start serach from last
  print(index);
  print(list);
  list.removeLast();
  list.remove(19);
  print(list);
  print(list.contains(12) ? "Found" : "Not Found");
  List<List<int>> arr3 = [
    [10, 20],
    [40, 20]
  ];
  print(arr3);
}

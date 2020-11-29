import 'dart:core';

void main() {
  String name = "Amit";
  String name2 =
      "Amit"; //both of the variable point to same memory unit as thier value is same
  print(name == name2);
  name =
      "Ram"; // String Immutable: means if we try to change Amit it will create new memory space rather than replacing it
  StringBuffer sb = new StringBuffer(name);
  StringBuffer sb2 = new StringBuffer(name2);
  print(sb ==
      sb2); // as heap create new memory for both name and name2 unlike string so return false
  sb.write("dasdsadsa");
  print(sb);

// Function;s on string
  String b1 = "Mr ram kumar";
  bool r = b1.startsWith("Mr");
  r = "Mr ram kumar".endsWith("kumar");
  r = b1.contains("Ram");
  int index = b1.indexOf("ram");
  print("Index of ram  is ${index}");
  index = b1.lastIndexOf("a");
  print("last Index of a  is ${index}");
  String substring = name.substring(1, 3);
  print("sub string of anme  ${substring}");
  String address = "A-10, Plot No -100 , Roop nagar";
  var arr = address.split(',');
  for (String arrv in arr) {
    print("ArrValue is $arrv");
  }
  print(("      ***************************   hi")
      .trim()); // remove spaces from begining and last
}
// if thier is lots of change's string is not recommended

import 'dart:ffi';
import 'dart:io';

void main() {
  var mae = "Ashu";
  // var is implicit way to declare datatype means set datatype on base of input
  print("name is " + mae.runtimeType.toString());
  // + sign concatenate stringw ith Type // Runtimetype is property of nae
  stdout.write("Hellow Dart"); // write is not part of dart
  print("Enter the First number");
  int firstnum = int.parse(stdin.readLineSync());
  print("Enter the second number");
  int secondtnum = int.parse(stdin.readLineSync());
  int result = firstnum + secondtnum;
  print("Result is $result");
  print("Sum is ${firstnum + secondtnum}");
}

//int, double comming from DartRepresentationOf
// stdin stdout come from dart:io
// $ = variable
// {} = expresion

main() {
  var name  = "Amit";
  print(name[0]);
  print(name[1]);
  print("name at ${name.codeUnitAt(0)}"); // Ascii type
  print("All code Ascii are ${name.codeUnits}");
  print("checked = ${name is String}");    // tell us the type of string
  print("Current =  "    + name.runtimeType.toString());
  print("Base    =  "    + name.runtimeType.runtimeType.toString());
}

// runtimeType tell us type;
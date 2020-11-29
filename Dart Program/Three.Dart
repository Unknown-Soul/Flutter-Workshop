main() {
  int e;
  print(e); // null: datatype is null type
  print(e.runtimeType); //  child of _Type
  int a = 100;
  String t = a.toString();
  String w = "100";
  int b = int.parse(w);
  int.parse(w,radix: 16);
  bool att = true;

  String msg = 'dsadsadsadas'
  'dsadas\ndsadsasad'
  'dasdsadsadasd';
  String msg2 = """this 
                   is multilien code""";
  print(msg);
  print(msg2);
}
// coneversion to hex 16 means convert w to hex using redix
// diffrence in null and NULL?
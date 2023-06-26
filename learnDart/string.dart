// import 'package:characters/characters.dart';
final String namex = 'odo';

void main(List<String> args) {
  String name = "Muhammad Rifqi";
  String hewan = "Kucing, Kambing, Penyu";

  // print(name);
  // print(name.contains("Rifqi"));
  // print(name.toLowerCase());
  // print(name.toUpperCase());

  print(hewan.split(",")[2]);
  print(name.substring(9));

  var hi = 'Hi 🇩🇰';
  print(hi);

  print('\"I\'m Rifqi\"');

  var conc = 'Bank'
      'Raya'
      "Indonesia";

  var con = """
This is also a
multiline string
""";

  print(conc);
  print(con);

// Cannot read name here, not initialized.
  // if (namex == "") {
  //   namex = "Bob";
  // } else {
  //   namex = "Robert";
  // }
  print(namex); // Properly initialized here.
}

void main() {
  print('hello, odo!');

  var name = 'Voyager I';
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };

  print('name: $name');
  print(year);
  print(antennaDiameter);
  print('flybyObjects: ${flybyObjects[0]}');
  print(image['tags']);
}

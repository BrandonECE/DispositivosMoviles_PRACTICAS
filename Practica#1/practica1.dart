import 'dart:io';

void main(List<String> args) {

  var hrs, min, seg;

  print("\nBIENVENIDO AL TEMPORIZADOR!\n");
  
  do {
    stdout.write("Ingresa las horas: ");
    hrs = int.parse(stdin.readLineSync()!);
  } while (hrs < 0);

  do {
    stdout.write("Ingresa los minutos (0 - 60 minutos admitidos): ");
    min = int.parse(stdin.readLineSync()!);
  } while (min < 0 || min > 60);

  do {
    stdout.write("Ingresa los segundos (0 - 60 segundos admitidos): ");
    seg = int.parse(stdin.readLineSync()!);
  } while (seg < 0 || seg > 60);

  print("\n\n");

  for (var i = hrs; i >= 0; i--) {
    for (var j = min; j >= 0; j--) {
      for (var z = seg; z >= 0; z--) {
        print("Time: $i : $j : $z");
      }
      seg = 60;
    }
    min = 60;
  }
  
  print("\n---Se finalizo el conteo!---");
}

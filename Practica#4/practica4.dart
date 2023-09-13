import 'dart:io';
import 'dart:isolate';
import 'dart:math';
import 'dart:async';

void main(List<String> args) async {
  int nNumeros = 10000;
  int nIsolate = 5;
  int rangeIsolate = nNumeros ~/ nIsolate;
  int resultado;

  File file = File(
      'C:/Users/Brandon Cantu/Documents/programacion lenguajes/dart/practicas/p4/numeros10k.txt');
  // file = createFile(file, nNumeros);
  List<int> valores10k = [];
  valores10k.addAll(await readFile(file));
  resultado = await createIsolates(valores10k, rangeIsolate, nIsolate);
  print("PROMEDIO FINAL: ${resultado/nNumeros}");
}

File createFile(File file, int nNumeros) {
  IOSink sink = file.openWrite();
  Random random = Random();

  for (int i = 1; i <= nNumeros; i++) {
    int valor = random.nextInt(101);
    if (i != nNumeros)
      sink.write('$valor,');
    else
      sink.write('$valor');
  }
  sink.close();
  print('Archivo creado exitosamente.');
  return file;
}

Future<List<int>> readFile(File file) async {
  List<int> valores = [];
  await file.readAsString().then((String contenido) {
    List<String> valoresString = contenido.split(',');
    for (var valorString in valoresString) {
      int valor = int.parse(valorString);
      valores.add(valor);
    }
  }).catchError((e) {
    print('ERROR: $e');
  });
  return valores;
}

class Arguments {
  Arguments(this.rangeIsolatesList, this.sendPort);
  List<int> rangeIsolatesList;
  SendPort sendPort;
}

Future<int> createIsolates(List<int> valores10k, int rangeIsolate, int nIsolate) async {
  List<Future<Isolate>> futures = [];
  List<int> rangeIsolatesList = [];
  int cont = 0;
  int suma = 0;

  Completer<int> completer = Completer();

  ReceivePort receivePort = ReceivePort();
  SendPort sendPort = receivePort.sendPort;

  for (var elementsRange in valores10k) {
    if (cont != rangeIsolate) {
      rangeIsolatesList.add(elementsRange);
      ++cont;
    }
    if (cont == rangeIsolate) {
      cont = 0;
      Arguments argumentos = Arguments(rangeIsolatesList, sendPort);
      futures.add(Isolate.spawn<Arguments>(isolateProcess, argumentos));

      rangeIsolatesList.clear();
    }
  }
  await Future.wait(futures);

  cont = 0;
  await receivePort.listen((message) async {
    ++cont;
    print("Isolate $cont: $message");
    suma += int.parse(message);
    if (cont == nIsolate) {
      completer.complete(suma);
      receivePort.close();
    }
  });
  return completer.future;
}

void isolateProcess(Arguments argumentos) {
  int suma = 0;
  for (var elements in argumentos.rangeIsolatesList) {
    suma += elements;
  }
  argumentos.sendPort.send(suma.toString());
}

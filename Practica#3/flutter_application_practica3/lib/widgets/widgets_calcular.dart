import 'package:flutter/material.dart';
import '../body.dart';

class MyInput extends StatelessWidget {
  MyInput({super.key, required this.inputGrados});
  TextEditingController inputGrados = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: TextFormField(
          keyboardType: TextInputType.number,
          controller: inputGrados,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
              icon: Icon(
                Icons.history_edu,
                color: Theme.of(context).colorScheme.secondary,
              ),
              labelStyle: const TextStyle(color: Colors.white, fontSize: 20),
              hintStyle: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
              hintText: "Escribe...",
              labelText: "Grados Centigrados"),
        ),
      ),
    );
  }
}


class MyGap extends StatelessWidget {
  const MyGap({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
    );
  }
}


class MyGapBig extends StatelessWidget {
  const MyGapBig({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 50,
    );
  }
}

class MyButton extends StatelessWidget {
  MyButton({super.key, required this.lblText, required this.evento});
  final String lblText;
  final VoidCallback evento;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: evento,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              Theme.of(context).colorScheme.inversePrimary),
          fixedSize: MaterialStateProperty.all<Size>(
            Size(MediaQuery.of(context).size.width * 0.8,
                50), // Ancho y alto del botón
          ),
        ),
        child: Text(
          lblText,
          style: const TextStyle(
            color: Colors.white,
          ),
        ));
  }
}

class MyResults extends StatelessWidget {
  MyResults({super.key, required this.fahrenheit, required this.kelvin});
  String fahrenheit;
  String kelvin;

    Widget rows(String modo, String valor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(modo,
            style: const TextStyle(color: Colors.white, fontSize: 30)),
        Container(
          child: Row(
            children: [
              const Icon(Icons.arrow_right, color: Colors.white,),
              Text(valor,
                  style: const TextStyle(
                      color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold))
            ],
          ),
        ),

      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
            width: 5,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          borderRadius: BorderRadius.circular(10)),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          rows("Fahrenheit", fahrenheit),
          rows("Kelvin", kelvin),
        ],
      ),
    );
    
  }
  
}


class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          width: MediaQuery.of(context).size.width,
          height: 20,
          color: Theme.of(context).colorScheme.inversePrimary, // Color de fondo del Container
          padding: const EdgeInsets.all(16.0), // Espacio interno
    );
  }
}
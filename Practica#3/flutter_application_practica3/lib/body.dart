import 'package:flutter/material.dart';
import 'widgets/widgets_calcular.dart';

class myBody extends StatefulWidget {
  const myBody({super.key, required this.title});
  final String title;

  @override
  State<myBody> createState() => _myBodyState();
}

class _myBodyState extends State<myBody> {
  TextEditingController inputGrados = TextEditingController();
  String fahrenheit = '---';
  String kelvin = '---';
  double calcular = 0;

  void event() {
    setState(() {
      calcular = (double.parse(inputGrados.text) * 1.8) + 32;
      fahrenheit = calcular.toStringAsFixed(1);
      calcular = double.parse(inputGrados.text) + 273.15;
      kelvin = calcular.toStringAsFixed(1);
      print(inputGrados.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inverseSurface,
      appBar: AppBar(
        title: Center(
            child: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        )),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: <Widget>[
          const MyGap(),
          MyInput(inputGrados: inputGrados),
          const MyGap(),
          MyButton( lblText: "CONVERTIR", evento: (() => event()),),
          const MyGapBig(),
          MyResults(fahrenheit: fahrenheit, kelvin: kelvin,)
        ],
      ),
      bottomSheet: const MyBottomSheet(),
    );
  }
}

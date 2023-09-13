import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MaterialColor barColor = Colors.blue;
  Color textColor = Colors.white;
  Color itemSelected = Colors.white;

  int _selIndex = 0; //Indice de pagina
  final controllerContent =
      TextEditingController(); //Valor controller en TextEditingController
  bool isExtended = true;
  String controllerContentString = ''; //Valor Controller de String
  List<String> notes = []; //Lista de valores en Strings
  List<Widget> notesHistory = []; //Lista de estructuas de Widgets

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      Container(
        child: Center(
          child: Container(
            ///BarraDeNotas
            // color: Colors.amber,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.history_edu,
                  size: 40,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(color: Colors.blue),
                        borderRadius: const BorderRadius.only(
                          topLeft:
                              Radius.circular(20.0), // Radio superior izquierdo
                          bottomLeft:
                              Radius.circular(20.0), // Radio superior derecho
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(4),
                        child: const ColorFiltered(
                          colorFilter:
                              ColorFilter.mode(Colors.white, BlendMode.srcIn),
                          child: Icon(
                            Icons.history_edu,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 800,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: const BorderRadius.only(
                          topRight:
                              Radius.circular(20.0), // Radio superior izquierdo
                          bottomRight:
                              Radius.circular(20.0), // Radio superior derecho
                        ),
                      ),
                      child: TextFormField(
                        controller: controllerContent,
                        decoration: const InputDecoration(
                          hintText: "Escriba una nueva nota...",
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () {
                      controllerContentString = controllerContent.text;
                      notes.add(controllerContentString);
                      print(notes);
                      controllerContent.clear();

                      notesHistory.add(
                        //AÑADIR UN NUEVO ELEMENTO A LA LISTA DE WIDGETS
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue.shade300,
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.all(15),
                              alignment: Alignment.center,
                              width: (MediaQuery.of(context).size.width - 300),
                              child: Text(
                                "$controllerContentString",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text(
                      "Crear una nueva nota",
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size(857, 60)),
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    )),
              ],
            ),
          ),
        ),
      ),
      Container(
          //Background Azul / notesHistoy
          child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          constraints: const BoxConstraints(
            minWidth: 800,
            minHeight: 600,
          ),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blue.shade300, width: 10),
              borderRadius: BorderRadius.circular(20)),
          height: MediaQuery.of(context).size.height * 0.9,
          width: (MediaQuery.of(context).size.width - 300),
          child: Column(
            //Lista de Widgets
            children: notesHistory,
          ),
        ),
      )),
    ];

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                selectedIconTheme: IconThemeData(
                  color: barColor,
                ),
                unselectedIconTheme: IconThemeData(color: itemSelected),
                minExtendedWidth: 200,
                backgroundColor: barColor,
                extended: isExtended,
                selectedIndex: _selIndex,
                destinations: [
                  NavigationRailDestination(
                    icon: const Icon(
                      Icons.history_edu,
                      size: 30,
                    ),
                    label: Text(
                      'Nueva Nota',
                      style: TextStyle(color: textColor, fontSize: 16),
                    ),
                  ),
                  NavigationRailDestination(
                    icon: const Icon(
                      Icons.event_note,
                      size: 30,
                    ),
                    label: Text(
                      'Notas',
                      style: TextStyle(color: textColor, fontSize: 16),
                    ),
                  ),
                ],
                onDestinationSelected: (index) {
                  print('Antes: $_selIndex Seleccionado: $index');
                  setState(() {
                    _selIndex = index;
                  });
                },
              ),
            ),
            Expanded(
              child: _screens[_selIndex],
            )
          ],
        )));
  }
}

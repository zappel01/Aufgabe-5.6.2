import 'package:flutter/material.dart';
import 'package:practice2/helpers/custom_stack_textfield.dart';

class BuchstabemZahl extends StatefulWidget {
  const BuchstabemZahl({super.key});

  @override
  State<BuchstabemZahl> createState() => _BuchstabemZahlState();
}

class _BuchstabemZahlState extends State<BuchstabemZahl> {
  List<String> zeichenketten = [];
  List<String> ergebnisse = [];

  TextEditingController zeichenketteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        title: const Text(
          'Buchstabenzahl',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: CustomStackTextField(
                controller: zeichenketteController,
                labelText: 'Gib eine Zeichenkette ein',
                borderRadius: 25,
                backgroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                berechneBuchstabenzahl();
              },
              child: const Text('Berechne Buchstabenzahl'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: ergebnisse.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(ergebnisse[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void berechneBuchstabenzahl() {
    String zeichenkette = zeichenketteController.text;
    int anzahlZeichen = zeichenkette.length;

    ergebnisse.add('$zeichenkette -> $anzahlZeichen');

    setState(() {});
  }
}

import 'package:flutter/material.dart';
import 'package:practice2/helpers/custom_stack_textfield.dart';

class Aufteilung extends StatefulWidget {
  const Aufteilung({super.key});

  @override
  State<Aufteilung> createState() => _AufteilungState();
}

class _AufteilungState extends State<Aufteilung> {
  TextEditingController zeichenketteController = TextEditingController();
  List<String> aufgeteilteZeichen = [];

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
          'Aufteilung',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: CustomStackTextField(
                controller: zeichenketteController,
                labelText: 'Gib eine Zeichenkette ein',
                borderRadius: 25,
                backgroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue)),
              onPressed: () {
                teileZeichenketteAuf();
              },
              child: const Text(
                'Aufteilen',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Text('Aufgeteilte Zeichen: ${aufgeteilteZeichen.join(', ')}'),
          ],
        ),
      ),
    );
  }

  void teileZeichenketteAuf() {
    String zeichenkette = zeichenketteController.text;
    List<String> zeichenListe = zeichenkette.split('');

    setState(() {
      aufgeteilteZeichen = zeichenListe;
    });
  }
}

import 'package:flutter/material.dart';
import 'package:practice2/helpers/custom_stack_textfield.dart';

class Vorzeichen extends StatefulWidget {
  const Vorzeichen({super.key});

  @override
  State<Vorzeichen> createState() => _VorzeichenState();
}

class _VorzeichenState extends State<Vorzeichen> {
  TextEditingController ersteZahlController = TextEditingController();
  TextEditingController zweiteZahlController = TextEditingController();
  String ergebnis = '';

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
          'Vorzeichen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: CustomStackTextField(
                controller: ersteZahlController,
                labelText: 'Gib eine Zahl ein',
                borderRadius: 25,
                backgroundColor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue)),
              onPressed: () {
                pruefeVorzeichen();
              },
              child: const Text(
                'Prüfe Vorzeichen',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text('Ergebnis: $ergebnis'),
          ],
        ),
      ),
    );
  }

  void pruefeVorzeichen() {
    double zahl = double.tryParse(ersteZahlController.text) ?? 0;

    if (zahl > 0) {
      setState(() {
        ergebnis = 'Die Zahl ist positiv.';
      });
    } else if (zahl < 0) {
      setState(() {
        ergebnis = 'Die Zahl ist negativ.';
      });
    } else {
      setState(() {
        ergebnis = 'Die Zahl ist 0.';
      });
    }
  }
}

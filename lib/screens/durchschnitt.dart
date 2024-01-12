import 'package:flutter/material.dart';
import 'package:practice2/helpers/custom_stack_textfield.dart';

class Durchschnitt extends StatefulWidget {
  const Durchschnitt({super.key});

  @override
  State<Durchschnitt> createState() => _DurchschnittState();
}

class _DurchschnittState extends State<Durchschnitt> {
  TextEditingController ersteZahlController = TextEditingController();
  TextEditingController zweiteZahlController = TextEditingController();
  double durchschnitt = 0.0;

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
          'Durchschnitt',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              child: CustomStackTextField(
                controller: ersteZahlController,
                labelText: 'Erste Zahl',
                borderRadius: 25,
                backgroundColor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 100,
              child: CustomStackTextField(
                controller: zweiteZahlController,
                labelText: 'Zweite Zahl',
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
                berechneDurchschnitt();
              },
              child: const Text(
                'Berechne Durchschnitt',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text('Durchschnitt: $durchschnitt'),
          ],
        ),
      ),
    );
  }

  void berechneDurchschnitt() {
    double zahl1 = double.tryParse(ersteZahlController.text) ?? 0.0;
    double zahl2 = double.tryParse(zweiteZahlController.text) ?? 0.0;

    setState(() {
      durchschnitt = (zahl1 + zahl2) / 2;
    });
  }
}

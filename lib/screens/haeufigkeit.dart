import 'package:flutter/material.dart';
import 'package:practice2/helpers/custom_stack_textfield.dart';

class Haeufigkeit extends StatefulWidget {
  const Haeufigkeit({super.key});

  @override
  State<Haeufigkeit> createState() => _HaeufigkeitState();
}

class _HaeufigkeitState extends State<Haeufigkeit> {
  TextEditingController wortController = TextEditingController();
  TextEditingController buchstabeController = TextEditingController();
  int haeufigkeit = 0;

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
          'Häufigkeit',
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
                controller: wortController,
                labelText: 'Wort',
                borderRadius: 25,
                backgroundColor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 200,
              child: CustomStackTextField(
                controller: buchstabeController,
                labelText: 'Buchstabe',
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
                berechneHaeufigkeit();
              },
              child: const Text(
                'Berechne Häufigkeit',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text('Häufigkeit des Buchstabens: $haeufigkeit'),
          ],
        ),
      ),
    );
  }

  void berechneHaeufigkeit() {
    String wort = wortController.text.toLowerCase();
    String buchstabe = buchstabeController.text.toLowerCase();
    int count = 0;

    for (int i = 0; i < wort.length; i++) {
      if (wort[i] == buchstabe) {
        count++;
      }
    }

    setState(() {
      haeufigkeit = count;
    });
  }
}

import 'package:flutter/material.dart';
import 'package:practice2/helpers/custom_stack_textfield.dart';

class FindChar extends StatefulWidget {
  const FindChar({super.key});

  @override
  State<FindChar> createState() => _FindCharState();
}

class _FindCharState extends State<FindChar> {
  TextEditingController buchstabeController = TextEditingController();
  TextEditingController textController = TextEditingController();
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
          'Finde den Buchstaben',
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
                controller: buchstabeController,
                labelText: 'Gib einen Buchstaben ein',
                borderRadius: 25,
                backgroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: CustomStackTextField(
                controller: textController,
                labelText: 'Gib einen Text ein',
                borderRadius: 25,
                backgroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue)),
              onPressed: () {
                findeBuchstaben();
              },
              child: const Text(
                'Finde Buchstabe',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Text('Ergebnis: $ergebnis'),
          ],
        ),
      ),
    );
  }

  void findeBuchstaben() {
    String buchstabe = buchstabeController.text.toLowerCase();
    String text = textController.text.toLowerCase();

    if (text.contains(buchstabe)) {
      setState(() {
        ergebnis = 'Der Buchstabe kommt im Text vor.';
      });
    } else {
      setState(() {
        ergebnis = 'Der Buchstabe kommt nicht im Text vor.';
      });
    }
  }
}

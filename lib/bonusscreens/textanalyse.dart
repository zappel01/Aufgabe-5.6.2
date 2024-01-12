import 'package:flutter/material.dart';
import 'package:practice2/helpers/custom_stack_textfield.dart';

class TextAnalyse extends StatefulWidget {
  const TextAnalyse({Key? key}) : super(key: key);

  @override
  State<TextAnalyse> createState() => _TextAnalyseState();
}

class _TextAnalyseState extends State<TextAnalyse> {
  String inputText = '';
  int spaceCount = 0;
  int vowelCount = 0;
  int otherCharacterCount = 0;

  void analyzeText() {
    // Reset counts
    spaceCount = 0;
    vowelCount = 0;
    otherCharacterCount = 0;

    // Analyze the input text
    for (int i = 0; i < inputText.length; i++) {
      String currentChar = inputText[i].toLowerCase();

      if (currentChar == ' ') {
        spaceCount++;
      } else if ('aeiou'.contains(currentChar)) {
        vowelCount++;
      } else {
        otherCharacterCount++;
      }
    }

    // Update the UI
    setState(() {});
  }

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
          'Text Analyse',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250,
              child: CustomStackTextField(
                labelText: 'Text eingeben',
                borderRadius: 25,
                backgroundColor: Colors.white,
                onChange: (value) {
                  inputText = value;
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue)),
              onPressed: () {
                analyzeText();
              },
              child: const Text(
                'Analyse starten',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Text('Leerzeichen: $spaceCount'),
            Text('Vokale: $vowelCount'),
            Text('Sonstige Zeichen: $otherCharacterCount'),
          ],
        ),
      ),
    );
  }
}

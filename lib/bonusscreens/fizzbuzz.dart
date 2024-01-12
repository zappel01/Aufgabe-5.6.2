import 'package:flutter/material.dart';
import 'package:practice2/helpers/custom_stack_textfield.dart';

class FizzBuzz extends StatefulWidget {
  const FizzBuzz({Key? key}) : super(key: key);

  @override
  State<FizzBuzz> createState() => _FizzBuzzState();
}

class _FizzBuzzState extends State<FizzBuzz> {
  int firstNumber = 1;
  int secondNumber = 15; // Default value, you can change this as needed

  void printFizzBuzz() {
    for (int i = firstNumber; i <= secondNumber; i++) {
      if (i % 3 == 0 && i % 5 == 0) {
        print('FizzBuzz');
      } else if (i % 3 == 0) {
        print('Fizz');
      } else if (i % 5 == 0) {
        print('Buzz');
      } else {
        print(i);
      }
    }
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
          'FizzBuzz',
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
                labelText: 'Startzahl',
                borderRadius: 25,
                backgroundColor: Colors.white,
                keyboardType: TextInputType.number,
                onChange: (value) {
                  if (value.isNotEmpty) {
                    firstNumber = int.parse(value);
                  }
                },
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 250,
              child: CustomStackTextField(
                labelText: 'Endzahl',
                borderRadius: 25,
                backgroundColor: Colors.white,
                keyboardType: TextInputType.number,
                onChange: (value) {
                  if (value.isNotEmpty) {
                    secondNumber = int.parse(value);
                  }
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                printFizzBuzz();
              },
              child: Text('FizzBuzz ausgeben'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> questions = [
    'Have you ever wrote a letter?',
    'Have you ever smoked a cigarette?',
    'Have you ever been hit on by someone who was too old?',
    'Have you ever been on the radio or on television?',
    'Have you ever stayed awake for an entire night?',
    'Have you ever broken something, like a window, and ran away?',
    'Have you ever won a contest and received a prize?',
    'Have you ever met a famous person or a celebrity?',
  ];
  int questionNumber = 0, yesCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Have You Ever'),
      ),
      body: Center(
        child: (questionNumber < 5)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    questions[questionNumber],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  ElevatedButton(
                    child: Text('Yes'),
                    onPressed: () {
                      setState(() {
                        questionNumber++;
                        yesCount++;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(100, 50),
                      primary: Colors.green,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  ElevatedButton(
                    child: Text('No'),
                    onPressed: () {
                      setState(() {
                        questionNumber++;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(100, 50),
                      primary: Colors.red,
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  (yesCount > 2)
                      ? Image.asset('assets/images/loser.png')
                      : Image.asset('assets/images/winner.png'),
                  ElevatedButton(
                    child: Text('Again'),
                    onPressed: () {
                      setState(() {
                        yesCount = 0;
                        questionNumber = 0;
                        questions.shuffle();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(100, 50),
                      primary: Colors.grey,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}

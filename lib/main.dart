import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Batu Kertas Gunting Game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyGamePage(),
    );
  }
}

class MyGamePage extends StatefulWidget {
  const MyGamePage({super.key});

  @override
  State<MyGamePage> createState() => _MyGamePageState();
}

class _MyGamePageState extends State<MyGamePage> {
  int _playerScore = 0;
  int _computerScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Batu Kertas Gunting Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Player Score: $_playerScore',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'Computer Score: $_computerScore',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _playGame(Choice.rock),
              child: const Text('Batu'),
            ),
            ElevatedButton(
              onPressed: () => _playGame(Choice.paper),
              child: const Text('Kertas'),
            ),
            ElevatedButton(
              onPressed: () => _playGame(Choice.scissors),
              child: const Text('Gunting'),
            ),
          ],
        ),
      ),
    );
  }

  void _playGame(Choice playerChoice) {
    Choice computerChoice = _getRandomChoice();
    String result = _calculateWinner(playerChoice, computerChoice);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Computer chose ${_choiceToString(computerChoice)}. $result'),
      ),
    );

    setState(() {
      if (result == 'Player wins!') {
        _playerScore++;
      } else if (result == 'Computer wins!') {
        _computerScore++;
      }
    });
  }

  Choice _getRandomChoice() {
    Random random = Random();
    List<Choice> choices = Choice.values;
    return choices[random.nextInt(choices.length)];
  }

  String _calculateWinner(Choice playerChoice, Choice computerChoice) {
    if (playerChoice == computerChoice) {
      return 'It\'s a tie!';
    } else if ((playerChoice == Choice.rock && computerChoice == Choice.scissors) ||
        (playerChoice == Choice.paper && computerChoice == Choice.rock) ||
        (playerChoice == Choice.scissors && computerChoice == Choice.paper)) {
      return 'Player wins!';
    } else {
      return 'Computer wins!';
    }
  }

  String _choiceToString(Choice choice) {
    switch (choice) {
      case Choice.rock:
        return 'Batu';
      case Choice.paper:
        return 'Kertas';
      case Choice.scissors:
        return 'Gunting';
      default:
        return '';
    }
  }
}

enum Choice {
  rock,
  paper,
  scissors,
}

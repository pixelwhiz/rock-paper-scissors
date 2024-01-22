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
      title: 'Game Batu Kertas Gunting',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String playerChoice = "";
  String computerChoice = "";
  String result = "";

  void _playGame(String choice) {
    setState(() {
      playerChoice = choice;
      computerChoice = _getComputerChoice();
      result = _getResult(playerChoice, computerChoice);
    });
  }

  String _getComputerChoice() {
    final List<String> choices = ['batu', 'kertas', 'gunting'];
    final Random random = Random();
    return choices[random.nextInt(choices.length)];
  }

  String _getResult(String player, String computer) {
    if (player == computer) {
      return 'It\'s a tie!';
    } else if ((player == 'batu' && computer == 'gunting') ||
        (player == 'kertas' && computer == 'batu') ||
        (player == 'gunting' && computer == 'kertas')) {
      return 'You win!';
    } else {
      return 'You lose!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Batu Kertas Gunting'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Player Choice: $playerChoice',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Computer Choice: $computerChoice',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Result: $result',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _playGame('batu'),
                  child: Text('Batu'),
                ),
                ElevatedButton(
                  onPressed: () => _playGame('kertas'),
                  child: Text('Kertas'),
                ),
                ElevatedButton(
                  onPressed: () => _playGame('gunting'),
                  child: Text('Gunting'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

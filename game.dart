import 'dart:math';
import 'package:flutter/material.dart';
import 'deco.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  String playerChoice = ' ';
  String computerChoice = ' ';
  int playerScore = 0;
  int computerScore = 0;
  String resultMessage = '';

  final Random random = Random();

  final Map<String, String> emoji = {
    'Rock': '✊',
    'Paper': '✋',
    'Scissors': '✌️',
  };

  void play(String choice) {
    String computer = ['Rock', 'Paper', 'Scissors'][random.nextInt(3)];

    setState(() {
      playerChoice = emoji[choice]!;
      computerChoice = emoji[computer]!;

      if (choice == computer) {
        resultMessage = 'It\'s a Tie 🤝';
      } else if ((choice == 'Rock' && computer == 'Scissors') ||
          (choice == 'Paper' && computer == 'Rock') ||
          (choice == 'Scissors' && computer == 'Paper')) {
        playerScore++;
        resultMessage = 'You Win 🎉';
      } else {
        computerScore++;
        resultMessage = 'You Lose 😢';
      }
    });
  }

  void resetGame() {
    setState(() {
      playerChoice = ' ';
      computerChoice = ' ';
      playerScore = 0;
      computerScore = 0;
      resultMessage = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 87, 89, 179),
      appBar: Deco.appBar('Rock Paper Scissors'),
      body: Deco.paddedColumn(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Deco.scoreText('Player'),
                  Deco.scoreText(playerScore.toString(), size: 30),
                ],
              ),
              Column(
                children: [
                  Deco.scoreText('Computer'),
                  Deco.scoreText(computerScore.toString(), size: 30),
                ],
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Deco.scoreText(playerChoice, size: 50),
              Deco.scoreText('VS', size: 30),
              Deco.scoreText(computerChoice, size: 50),
            ],
          ),
          Deco.scoreText(resultMessage, size: 24, bold: true),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => play('Rock'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                ),
                child: const Text('✊', style: TextStyle(fontSize: 40)),
              ),
              ElevatedButton(
                onPressed: () => play('Paper'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                ),
                child: const Text('✋', style: TextStyle(fontSize: 40)),
              ),
              ElevatedButton(
                onPressed: () => play('Scissors'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                ),
                child: const Text('✌️', style: TextStyle(fontSize: 40)),
              ),
            ],
          ),

          IconButton(
            onPressed: resetGame,
            icon: const Icon(Icons.refresh, size: 40),
          ),
        ],
      ),
    );
  }
}

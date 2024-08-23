import 'package:flutter/material.dart';
import 'dart:math';

final random = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  String activeDiceImage = "assets/images/dice-2.png";

  void rollDice() {
    List<String> dice = [
      "assets/images/dice-1.png",
      "assets/images/dice-2.png",
      "assets/images/dice-3.png",
      "assets/images/dice-4.png",
      "assets/images/dice-5.png",
      "assets/images/dice-6.png",
    ];
    int randomNum = 0 + random.nextInt(dice.length);

    setState(() {
      activeDiceImage = dice[randomNum];
      // activeDiceImage = "assets/images/dice-$randomNum.png";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          activeDiceImage,
          width: 200,
        ),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(onPressed: rollDice, child: const Text("Roll Dice")),
      ],
    );
  }
}

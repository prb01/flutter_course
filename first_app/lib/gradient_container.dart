import 'package:first_app/dice_roller.dart';
import 'package:flutter/material.dart';

const beginAlignment = Alignment.topLeft;
const endAlignement = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    super.key,
    this.colors = const [
      Color.fromARGB(255, 84, 152, 162),
      Color.fromARGB(255, 158, 105, 80),
    ],
  });

  final List<Color> colors;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: beginAlignment,
          end: endAlignement,
        ),
      ),
      child: Center(
        child: DiceRoller(),
      ),
    );
  }
}

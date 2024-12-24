import 'dart:math';

import 'package:flutter/material.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll = 2;

  void rollDice() { //function that will be called later within build method 
                    //return void because onPressed wants void as a return type
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(context) {
    return Column( //add column widget to display content vertically
      mainAxisSize: MainAxisSize.min, //to minimize the size of column to litmit only within the screen
      children: [ //children is properties of column widget
        Image.asset( //Image is a built.in widget and has asset as a default constructor
          'assets/images/dice-$currentDiceRoll.png',
          width: 200,
        ),
        const SizedBox(height: 20), //fixed size, cutting off contents if they are too long 
        TextButton(
          onPressed: rollDice, //rollDice function as a value, don't exacute but point to that function
          style: TextButton.styleFrom(
            // padding: const EdgeInsets.only(
            //   top: 20,
            // ),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 28,
            ),
          ),
          child: const Text('Roll Dice'),
        )
      ],
    );
  }
}

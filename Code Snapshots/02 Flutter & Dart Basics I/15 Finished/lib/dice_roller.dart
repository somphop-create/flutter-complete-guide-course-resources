import 'dart:math';

import 'package:flutter/material.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget { //3 create a class extending StatefulWidget
  const DiceRoller({super.key}); //constructor function as always

  @override
  State<DiceRoller> createState() { //4 do not need build method, but createState method
                                    //return type is 'State' prase DiceRoller state (our class)
    return _DiceRollerState();      //return value that have State type (create another class below)
  }
}

class _DiceRollerState extends State<DiceRoller> { //5 return value
                                                   //typically starts with _ and appends 'State' to the end of parent widget above
                                                   //_ means this class is only private in this file and uses internall
  var currentDiceRoll = 2;

  void rollDice() { //2 function that will be called later within build method 
                    //return void because onPressed wants void as a return type
    setState(() { //7 fluter won't reexacute the build method below, and don't update the changes
                 //we have to tell it to do it by setting state with needed function
      currentDiceRoll = randomizer.nextInt(6) + 1;
    });
  }

  @override // 6 add build method (belongs to _DiceRollerState)
  Widget build(context) {
    return Column( //1 add column widget to display content vertically
      mainAxisSize: MainAxisSize.min, //to minimize the size of column to litmit only within the screen
      children: [ //1 children is properties of column widget
        Image.asset( //1 Image is a built.in widget and has asset as a default constructor
          'assets/images/dice-$currentDiceRoll.png',
          width: 200,
        ),
        const SizedBox(height: 20), //1 fixed size, cutting off contents if they are too long 
        TextButton(
          onPressed: rollDice, //2 rollDice function as a value, don't exacute but point to that function
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

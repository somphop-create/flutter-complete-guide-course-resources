import 'package:flutter/material.dart';

import 'package:basics/dice_roller.dart';

//4 declare variable here for convenience
//variables should be const not var because these values here should not be change thereafter
//and the values are constant values which can be loged-in at the complie time
const startAlignment = Alignment.topLeft; 
const endAlignment = Alignment.bottomRight;
//Alighment? startAlignment; means variable accept either alignment type or null
//but cannot be used here since 'begin' cannot accept null

class GradientContainer extends StatelessWidget { //1 add logic from Statelesswidget to MyApp class
  const GradientContainer(this.color1, this.color2, {super.key}); //Initialization with super.key
  //5 to use constructor function, we have to accept parameters here (color1 and color2 here)
  //becasue Dart will know which variables to look for in the class
  //they should be positional parameter because it is required (named paprameter is optional)
  
  const GradientContainer.purple({super.key})
      : color1 = Colors.deepPurple,
        color2 = Colors.indigo;
  //optional way to use constructor function widget.nameofconstructorfunction 

  final Color color1;
  final Color color2;
  //6 the variables have to be declared and stored inside class because Dart won't know if we don't do?

  @override //3 make it clear we are using widget by overriding it
  Widget build(context) { //2 build method (function) is required for building custom widget
                          //Widget is a return value type of this build function
                          //Context parameter is needed here to address the widget position
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}

// class GradientContainer extends StatelessWidget {
//   const GradientContainer({super.key, required this.colors});

//   final List<Color> colors;

//   @override
//   Widget build(context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: colors,
//           begin: startAlignment,
//           end: endAlignment,
//         ),
//       ),
//       child: const Center(
//         child: StyledText('Hello World!'),
//       ),
//     );
//   }
// }

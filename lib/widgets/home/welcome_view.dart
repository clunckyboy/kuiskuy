import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../state/quiz_state.dart';
import '../shared/main_button.dart';

class WelcomeView extends StatelessWidget{
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context){
    final quizState = Provider.of<QuizState>(context, listen: false);

    final screenSize = MediaQuery.of(context).size;

    return OrientationBuilder(
      builder: (context, orientation) {
        final bool isPortrait = orientation == Orientation.portrait;

        final double titleFontSize =
            isPortrait ? screenSize.width * 0.1 : screenSize.height * 0.15;
        final double vSpace =
            isPortrait ? screenSize.height * 0.05 : screenSize.height * 0.1;

        return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'KUISKUY',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: titleFontSize,
                  ),
                ),
                SizedBox(height: vSpace),
                MainButton(
                  text: 'START QUIZ',
                  onPressed: (){
                    quizState.startQuiz();
                  },
                ),
              ],
            )
        );
      },
    );
  }
}
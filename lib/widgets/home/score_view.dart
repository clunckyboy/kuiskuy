import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../state/quiz_state.dart';

class ScoreView extends StatelessWidget {
  const ScoreView({super.key});

  @override
  Widget build(BuildContext context) {
    final quizState = Provider.of<QuizState>(context, listen: false);
    final screenSize = MediaQuery.of(context).size;

    return Center(
      child: OrientationBuilder(
        builder: (context, orientation) {
          final bool isPortrait = orientation == Orientation.portrait;

          final double titleFontSize =
          isPortrait ? screenSize.width * 0.06 : screenSize.height * 0.06;
          final double scoreFontSize =
          isPortrait ? screenSize.width * 0.12 : screenSize.height * 0.12;
          final double vSpace =
          isPortrait ? screenSize.height * 0.03 : screenSize.height * 0.03;
          final double submitBtnFontSize = screenSize.width * (isPortrait ? 0.04 : 0.025);

          final double menuBtnHPadding = screenSize.width * (isPortrait ? 0.08 : 0.06);
          final double menuBtnVPadding = screenSize.height * (isPortrait ? 0.015 : 0.025);

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your point is',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: titleFontSize,
                ),
              ),
              SizedBox(height: vSpace),
              Text(
                '${quizState.score}/${quizState.totalQuestions}',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: scoreFontSize,
                ),
              ),
              SizedBox(height: vSpace * 1.5),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 500,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    quizState.goToMainMenu();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: menuBtnHPadding,
                      vertical: menuBtnVPadding,
                    ),
                  ),
                  child: Text(
                    'Main menu',
                    style: TextStyle(
                      fontSize: submitBtnFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}



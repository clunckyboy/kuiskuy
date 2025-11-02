import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../state/quiz_state.dart';
import '../shared/main_button.dart';

class ScoreView extends StatelessWidget {
  const ScoreView({super.key});

  @override
  Widget build(BuildContext context) {
    final quizState = Provider.of<QuizState>(context, listen: false);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Your point is',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 24),
          Text(
            '${quizState.score}/${quizState.totalQuestions}',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 40),
          MainButton(
            text: 'Main menu',
            onPressed: () {
              quizState.goToMainMenu();
            },
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:kuis_uts/models/quiz_result_model.dart';
import 'package:provider/provider.dart';
import '../state/quiz_state.dart';
import '../widgets/home/enter_name_view.dart';
import '../widgets/home/quiz_view.dart';
import '../widgets/home/score_view.dart';
import '../widgets/home/welcome_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Consumer<QuizState>(
      builder: (context, quizState, child){
        switch (quizState.status){
          case QuizStatus.initial:
            return const WelcomeView();
          case QuizStatus.enteringName:
            return const EnterNameView();
          case QuizStatus.inProgress:
            return const QuizView();
          case QuizStatus.completed:
            return const ScoreView();
        }
      },
    );
  }
}
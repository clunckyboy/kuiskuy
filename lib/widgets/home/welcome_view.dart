import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../state/quiz_state.dart';
import '../shared/main_button.dart';

class WelcomeView extends StatelessWidget{
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context){
    final quizState = Provider.of<QuizState>(context, listen: false);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'KUISKUY',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(height: 40), // const
          MainButton(
            text: 'START QUIZ',
            onPressed: (){
              quizState.startQuiz();
            },
          ),
        ],
      )
    );
  }
}
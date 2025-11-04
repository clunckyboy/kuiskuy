import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../state/history_state.dart';
import '../../state/quiz_state.dart';
import '../shared/main_button.dart';
import '../shared/quiz_option_button.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {

    final historyState = Provider.of<HistoryState>(context, listen: false);

    return Consumer<QuizState>(
      builder: (context, quizState, child) {
        final question = quizState.currentQuestion;
        final isLastQuestion = quizState.currentQuestionIndex == quizState.totalQuestions - 1;

        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              // 1. Progress
              Text(
                '${quizState.currentQuestionIndex + 1}/${quizState.totalQuestions}',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.grey[700]),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 24),

              // 2. Teks Pertanyaan
              Text(
                question.text,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // 3. Opsi Jawaban
              ...List.generate(question.option.length, (index) {
                final isSelected = quizState.selectedAnswers[quizState.currentQuestionIndex] == index;
                return QuizOptionButton(
                  text: question.option[index],
                  isSelected: isSelected,
                  onPressed: () {
                    quizState.selectAnswer(index);
                  },
                );
              }),

              const Spacer(), // Dorong navigasi ke bawah

              // 4. Tombol Navigasi
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Tombol Back
                  if (quizState.currentQuestionIndex > 0)
                    IconButton(
                      icon: const Icon(Icons.arrow_back, size: 30),
                      onPressed: () => quizState.prevQuestions(),
                    )
                  else
                    const SizedBox(width: 48), // Placeholder agar alignment tetap

                  // Tombol Next atau Submit
                  if (!isLastQuestion)
                    IconButton(
                      icon: const Icon(Icons.arrow_forward, size: 30),
                      onPressed: () => quizState.nextQuestion(),
                    )
                  else
                    MainButton(
                      text: 'Submit',
                      onPressed: () {
                        quizState.submitQuiz(historyState);
                      },
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
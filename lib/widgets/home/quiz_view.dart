import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../state/history_state.dart';
import '../../state/quiz_state.dart';
import '../shared/quiz_option_button.dart';

class QuizView extends StatelessWidget {
  QuizView({super.key});

  @override
  Widget build(BuildContext context) {

    final historyState = Provider.of<HistoryState>(context, listen: false);
    final screenSize = MediaQuery.of(context).size;


    return Consumer<QuizState>(
      builder: (context, quizState, child) {
        final question = quizState.currentQuestion;
        final isLastQuestion = quizState.currentQuestionIndex == quizState.totalQuestions - 1;

        return OrientationBuilder(
            builder: (context, orientation) {
              final bool isPortrait = orientation == Orientation.portrait;

              final double hPadding = screenSize.width * (isPortrait ? 0.06 : 0.1);
              final double vPadding = screenSize.height * (isPortrait ? 0.03 : 0.05);
              final double questionFontSize = screenSize.width * (isPortrait ? 0.06 : 0.035);
              final double progressFontSize = screenSize.width * (isPortrait ? 0.05 : 0.03);

              final double submitBtnHPadding = screenSize.width * (isPortrait ? 0.08 : 0.06);
              final double submitBtnVPadding = screenSize.height * (isPortrait ? 0.015 : 0.025);
              final double submitBtnFontSize = screenSize.width * (isPortrait ? 0.04 : 0.025);

              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: hPadding,
                  vertical: vPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    // 1. Progress
                    Text(
                      '${quizState.currentQuestionIndex + 1}/${quizState.totalQuestions}',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.grey[700],
                        fontSize: progressFontSize,
                      ),
                      textAlign: TextAlign.left,
                    ),

                    SizedBox(height: 16),

                    Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              //2. Pertanyaan
                              Text(
                                question.text,
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontSize: questionFontSize,
                                ),
                                textAlign: TextAlign.center,
                              ),

                              SizedBox(height: 24),

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
                            ],
                          ),
                        )
                    ),

                    const SizedBox(height: 16),

                    // 4. Tombol Navigasi
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Tombol Back
                        if (quizState.currentQuestionIndex > 0)
                          IconButton(
                            icon: const Icon(Icons.arrow_back),
                            iconSize: screenSize.width * (isPortrait ? 0.08 : 0.05),
                            onPressed: () => quizState.prevQuestions(),
                          )
                        else
                          const SizedBox(width: 48),

                        // Tombol Next atau Submit
                        if (!isLastQuestion)
                          IconButton(
                            icon: const Icon(Icons.arrow_forward),
                            iconSize: screenSize.width * (isPortrait ? 0.08 : 0.05),
                            onPressed: () => quizState.nextQuestion(),
                          )
                        else
                          ElevatedButton(
                            onPressed: () {
                              quizState.submitQuiz(historyState);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[300],
                                foregroundColor: Colors.black,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: submitBtnHPadding,
                                  vertical: submitBtnVPadding,
                                ),
                            ),
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                  fontSize: submitBtnFontSize,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                          ),
                      ],
                    ),
                  ],
                ),
              );
            }
        );
      },
    );
  }
}
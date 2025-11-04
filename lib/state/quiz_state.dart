import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../data/dummy_questions.dart';
import '../models/question_model.dart';
import '../models/quiz_result_model.dart';
import 'history_state.dart';

enum QuizStatus { initial, enteringName, inProgress, completed }

class QuizState with ChangeNotifier {
  QuizStatus _status = QuizStatus.initial;
  String _name = '';
  int _currentQuestionIndex = 0;
  final Map<int, int> _selectedAnswers = {};
  int _score = 0;

  QuizStatus get status => _status;
  String get name => _name;
  int get currentQuestionIndex => _currentQuestionIndex;
  Map<int, int> get selectedAnswers => _selectedAnswers;
  int get score => _score;
  Question get currentQuestion => dummyQuestion[_currentQuestionIndex];
  int get totalQuestions => dummyQuestion.length;

  void startQuiz(){
    _status = QuizStatus.enteringName;
    notifyListeners();
  }

  void setName(String name){
    _name = name;
    _status = QuizStatus.inProgress;
    notifyListeners();
  }

  void selectAnswer(int optionIndex){
    _selectedAnswers[_currentQuestionIndex] = optionIndex;
    notifyListeners();
  }

  void nextQuestion(){
    if(_currentQuestionIndex < totalQuestions - 1){
      _currentQuestionIndex++;
      notifyListeners();
    }
  }

  void prevQuestions(){
    if(_currentQuestionIndex > 0){
      _currentQuestionIndex--;
      notifyListeners();
    }
  }

  void submitQuiz(HistoryState historyState){
    _score;
    _selectedAnswers.forEach((questionIndex, answerIndex) {
      if (dummyQuestion[questionIndex].correctAnswerIndex == answerIndex){
        _score++;
      }
    });

    historyState.addResult(
      QuizResult(
          name: _name,
          score: _score,
          totalQuestions: totalQuestions,
      ),
    );

    _status = QuizStatus.completed;
    notifyListeners();
  }

  void goToMainMenu(){
    _status = QuizStatus.initial;
    _name = '';
    _currentQuestionIndex = 0;
    _selectedAnswers.clear();
    _score = 0;

    notifyListeners();
  }
}
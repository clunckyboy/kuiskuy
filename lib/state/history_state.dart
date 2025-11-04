import 'package:flutter/foundation.dart';
import 'package:kuis_uts/models/question_model.dart';
import '../models/quiz_result_model.dart';

class HistoryState with ChangeNotifier {
  final List<QuizResult> _history = [];

  List<QuizResult> get history => _history;

  void addResult(QuizResult result){
    _history.insert(0, result);
    notifyListeners();
  }
}
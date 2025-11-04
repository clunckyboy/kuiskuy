import 'package:flutter/material.dart';
import '../../models/quiz_result_model.dart';

class HistoryCard extends StatelessWidget{
  final QuizResult result;

  HistoryCard({ //const
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context){
    return Card(
      color: Colors.grey[200],
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: 8), //const
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(22.0), //const
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              result.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              '${result.score}/${result.totalQuestions}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/history_state';
import '../widgets/shared/history_card.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'HISTORY',
            style: Theme.of(context).textTheme.displayLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Expanded(
              child: Consumer<HistoryState>(
                builder: (context, historyState, child){
                  if(historyState.history.isEmpty){
                    return Center(
                      child: Text(
                        'You have no history',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.grey),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: historyState.history.length,
                    itemBuilder: (context, index){
                      final result = historyState.history[index];
                      return historyCard(result: result)
                    },
                  );
                },
              ),
          ),
        ],
      ),
    );
  }
}
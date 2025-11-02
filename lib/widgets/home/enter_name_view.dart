import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../state/quiz_state.dart';
import '../shared/main_button.dart';

class EnterNameView extends StatefulWidget{
  const EnterNameView({super.key});

  @override
  State<EnterNameView> createState() => _EnterNameViewState();
}

class _EnterNameViewState extends State<EnterNameView>{
  final _nameController = TextEditingController();

  @override
  void dispose(){
    _nameController.dispose();
    super.dispose();
  }

  void _submitName(){
    if(_nameController.text.trim().isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
        content: Text('Nama tidak boleh kosong!')),
      );
      return;
    }
    Provider.of<QuizState>(context, listen: false)
      .setName(_nameController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Enter your name',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 24),
          MainButton(
            text: 'Next',
            onPressed: _submitName,
          ),
        ],
      ),
    );
  }
}
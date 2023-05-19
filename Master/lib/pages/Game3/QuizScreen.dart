import 'dart:async';

import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}


class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  int _score = 0;
  final TextEditingController _textEditingController = TextEditingController();
  final List<Question> _questions = [
    Question('Quelle est la capitale des Bermudes ?', 'Hamilton'),
    Question('Quelle est la couleur du ciel par temps clair ?', 'bleu'),
    Question('Quelle est la planète la plus proche du soleil ?', 'mercure'),
    Question('Quel est le plus grand océan de la planète ?', 'pacifique'),
    Question('Combien de pays y a-t-il dans le monde ?', '195'),
    //Question('Qui a écrit "Les Misérables" ?', 'Victor Hugo'),
    //Question('Quel est le plus grand désert du monde ?', 'Sahara'),
    //Question('Quel est le plus grand fleuve du monde ?', 'nil'),
   // Question('Qui est l\'auteur du tableau "La Joconde" ?', 'Léonard de Vinci'),
    /*Question('Quel est le plus haut sommet du monde ?', 'l\'Everest'),
    Question('Quel est le plus grand pays du monde ?', 'Russie'),
    Question('Qui a découvert l\'Amérique ?', 'Christophe colomb'),
    Question('Quel est le nom de la première personne à avoir marché sur la lune ?', 'Neil Armstrong'),
    Question('Quelle ville a construit le premier métro ', 'Londres'),
    Question('De quel côté de l\'assiete doit-on poser le verre a vin ?', 'A droite'),
    Question('Qui est l\'heroine de "Notre-Dame de Paris" ?', 'Esmeralda'),
    Question('Quel fleuve a le plus gros débit au monde ?', 'l\'Amazone'),
    Question('Lequel des cinq sens manque au serpent ?', 'l\'ouie'),
    Question('Combien y a-t-il de signes astrologiques chinois ? ', '12'),
    Question('De qui est amoureux Juliette ? ', 'Roméo'),
    Question('Quel est le plus long fleuve de France ? ', 'Rhin'),
    Question('Combien d\'États y-a-t-il aux États-Unis ? ', '50'),
    Question('En quelle année la 5 ème république a-t-elle été proclamée ?', '1958'),
    Question('Où la première bombe atomique a-t-elle été utilisée ', ' Hiroshima'),
    Question('En quelle année la Seconde Guerre mondiale a-t-elle pris fin ?', '1945'),*/

  ];
  String _userAnswer = '';
  String _correctAnswer = '';
  Timer? _timer;

  void _submitAnswer() {
    setState(() {
      _userAnswer = _textEditingController.text.toLowerCase();
      _correctAnswer = _questions[_currentIndex].answer;

      if (_questions[_currentIndex].isCorrectAnswer(_userAnswer)) {
        _score++;
        _correctAnswer = '';
      }

      if (_currentIndex < _questions.length - 1) {
        _currentIndex++;
        _textEditingController.clear();

       //ajouter code de chat
        _timer?.cancel(); // fin

      } else {
        _showQuizResultDialog();
      }
    });
   _timer = Timer(const Duration(seconds: 5), () {
      setState(() {
        _currentIndex++;
        _userAnswer = '';
        //_feedback = '';
      });
    });

  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }


  void _showQuizResultDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Quiz terminé !'),
          content: Column(
            children: [
              Text('Votre score est de $_score sur ${_questions.length} questions.'),
              const SizedBox(height: 16.0),
              ElevatedButton(
                child: const Text('Recommencer'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _resetQuiz();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _resetQuiz() {
    setState(() {
      _currentIndex = 0;
      _score = 0;
      _userAnswer = '';
      _correctAnswer = '';
      _textEditingController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Quiz App'),
      ),
      body: Container(
        color: Colors.blueGrey[50],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _questions[_currentIndex].question,
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                labelText: 'Votre réponse',
                border: OutlineInputBorder(),
                //errorText: _userAnswer.isNotEmpty && _userAnswer != _correctAnswer ? 'Mauvaise réponse' : null,
              ),
              onSubmitted: (String userAnswer) {
                _submitAnswer();
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              child: const Text('Valider'),
              onPressed: () {
                _submitAnswer();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                fixedSize: Size(200, 70),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Spécifier le rayon de bordure pour obtenir des bords arrondis
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              _correctAnswer.isNotEmpty ? 'La bonne réponse était : $_correctAnswer' : '',
              style: const TextStyle(fontSize: 16.0, color: Colors.red),
            ),
          ],
        ),
      ),
      )
    );
  }
}

class Question {
  String question;
  String answer;

  Question(this.question, this.answer);

  bool isCorrectAnswer(String userAnswer) {
    return userAnswer.trim().toLowerCase() == answer.toLowerCase();
  }

}






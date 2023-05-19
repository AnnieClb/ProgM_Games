import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:master/pages/Game1/quizlogic.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../event_page.dart';

import 'train2.dart';
class Train1 extends StatefulWidget {
  const Train1({Key? key}) : super(key: key);

  @override
  State<Train1> createState() => _Train1State();
}

class _Train1State extends State<Train1> {
  QuizLogic quizLogic = QuizLogic();
  List<Icon> scoreIcon = [];
  // Variable pour les bonnes réponses
  int numberOfGoodAnswer =0;
  int scorefinal=0;
  // Compte à rebours pour chaque question
  late Timer timer;
  int start = 5;
// Ajouter du son
  //final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  //Implémenter le compte à rebours
  void startTimer(){
    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (start < 1){
          //le compte à rebours est à zéro
          handleAnswer(null);
        }else {
          start--;
        }

      });
    });
  }


  updateScore({isGood}) {
    setState(() {
      scoreIcon = List.from(scoreIcon);
      if (isGood) {
        scoreIcon.add(
            Icon(Icons.check, color: Colors.green[800], size: 30,)
        );
      } else {
        scoreIcon.add(
            Icon(Icons.close, color: Colors.redAccent, size: 30,)
        );
      }
    });
  }

  handleAnswer(String? userAnswer) {
    // Si l'utilisateur repond correctement
    if (quizLogic.getCorrectAnswer() == userAnswer) {
      //incrémente les bonnes réponses
      numberOfGoodAnswer++;
      scorefinal = numberOfGoodAnswer*5;
      updateScore(isGood: true);
    } else { // Si l'utilisateur repond faux
      updateScore(isGood: false);
    }
    setState(() {
      start = 5;
    });

    // On vérifie si le quiz est terminé
    if(quizLogic.isFinshed()){

      timer.cancel();
      // Alerte pour donner le score
      Alert(

        context: context,
        title: "Partie terminée",
        desc: "Tu as $numberOfGoodAnswer bonnes réponses.\n ton score est de $scorefinal/200",
        buttons: [
          DialogButton(
            onPressed: () {
              //player.stop();
              Navigator.push(
                  context,
                  PageRouteBuilder(pageBuilder: (_, __, ___) =>EventPage() )
              );
            },
            width: 100,
            color: Colors.deepPurple, // Couleur rouge du bouton
            child: const Text(
              "Quitter",
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
          DialogButton(
            onPressed: () {
              //player.stop();
              Navigator.push(
                  context,
                  PageRouteBuilder(pageBuilder: (_, __, ___) =>HomePage() )
              );
            },
            width: 100,
            color: Colors.deepPurple, // Couleur rouge du bouton
            child: const Text(
              "NextGame",
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),

        ],
      ).show();
    }else{
      setState(() {
        quizLogic.nextQuestion();
      });

    }
  }
// ajouter du son
  @override
  Widget build(BuildContext context) {
    //player.play(AssetSource('audio_player/flagsoung.wav'));
    return Scaffold(
      body: Container(
        color: Colors.blueGrey[800],
        /* decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/monde.png'),
            fit: BoxFit.cover,
          ),
        ),*/
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text('$start',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.redAccent,),),
              ),
              Container(
                height: 300,
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Image.asset('assets/images/flags/${quizLogic.getFlagName()}'),
              ),

              // Réponse 1
              CButton(textButton: quizLogic.getAnswer1(),
                onPressed: () {
                  handleAnswer(quizLogic.getAnswer1());
                },
              ),
              CButton(textButton: quizLogic.getAnswer2(),
                  onPressed: () {
                    handleAnswer(quizLogic.getAnswer2());
                  }),
              CButton(textButton: quizLogic.getAnswer3(),
                  onPressed: () {
                    handleAnswer(quizLogic.getAnswer3());
                  }),

              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 05.0),
                    height: 200,
                    //color: Colors.green,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: scoreIcon,
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );

  }

}

////



class CButton extends StatelessWidget {
  final String textButton;
  final Color color;
  final Function onPressed;

  const CButton({super.key, required this.textButton, required this.onPressed, this.color = Colors.deepPurple});

  @override
  Widget build(BuildContext context) {
    var container = Container();
    return Container(
        padding: const EdgeInsets.only(
          left: 40,
          right: 40,
          bottom: 40,
        ),
        child: ElevatedButton(

          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            fixedSize: Size(200, 70),
          ),
          onPressed: () => onPressed(),
          child: Text(
            textButton,
            style: TextStyle(fontSize: 20),
          ),
        )
    );
  }
}


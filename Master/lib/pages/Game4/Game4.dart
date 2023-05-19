import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

const mainColor = Color(0xfffd287e);
const whiteColor = Color(0xff50047f);

final player = AudioPlayer();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text('Game Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(
                  "assets/images/robot_girl.png",
                  height: 100,
                  width: 100,
                )
            ),
            const Center(
              child: Text(
                "Welcome to the Game",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: whiteColor),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Naviguer vers l'écran de jeu
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OneTwoThreeSunGame()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                fixedSize: Size(200, 70),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Spécifier le rayon de bordure pour obtenir des bords arrondis
                ),
              ),
              child: const Text('Start', ),

            ),
          ],
        ),
      ),
    );
  }
}


class  OneTwoThreeSunGame extends StatefulWidget {
  const OneTwoThreeSunGame({super.key});

  @override
  State<OneTwoThreeSunGame> createState() => _OneTwoThreeSunGame();
}

class _OneTwoThreeSunGame extends State<OneTwoThreeSunGame> {
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 4;
  var isCountDown = false;
  var gameOver = false;
  var score = 0;



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text("1, 2, 3 Soleil"),
      ),
      body:gameOver ? gameOverWidget(): gameWidget(),
    );
  }


  Widget gameOverWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
            child: Image.asset(
              "assets/images/robot_girl.png",
              height: 100,
              width: 100,
            )
        ),
        const Center(
          child: Text(
            "Game Over",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: whiteColor),
          ),
        ),
        const SizedBox(height: 30,), //separateur
        Text(
          "Your score: $score",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: whiteColor),
        ),
        const SizedBox(height: 30,),
        ElevatedButton(
            onPressed: () {
              setState(() {
                score = 0;
                gameOver = false;
                endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 4;
              });
            },
            style: ElevatedButton.styleFrom(backgroundColor: mainColor),
            child:const Text('Play Again')
        ),
      ],
    );
  }

  Widget gameWidget() {
    player.play(AssetSource('audio_player/1-2-3-.mp3'));
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(flex: 1),

        CountdownTimer(

          widgetBuilder: (__, CurrentRemainingTime? time) {
            isCountDown = time != null;
            //player.play(AssetSource('audio_player/1-2-3.mp3'));
            String textToShow;
            if (time == null){
              textToShow = 'Soleil!';
            } else if (time.sec == 3) {
              textToShow = '1';
            } else if (time.sec == 2) {
              textToShow = '2';
            } else {
              textToShow = '3';
            }
            return Column(
              children: [
                Center(child: Image.asset(time == null ? "assets/images/end-counter_robot-girl.jpeg": "assets/images/counter_Robot-Girl.png", height: 200, width: 200,)),
                Center(
                    child: Text(
                      textToShow,
                      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: whiteColor),
                    )),
              ],
            ); //Text
          },
          endTime: endTime,
          onEnd: () async {
            if(gameOver) return;
            await Future.delayed(const Duration(seconds: 10));
            setState(() {
              endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 4;
            });
          },
        ),
        const Spacer(flex: 1),
        SizedBox(
          width: 150,
          height: 150,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                if(isCountDown) {
                  score++;
                } else {
                  gameOver = true;
                  player.stop();
                }
              });
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: mainColor,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(24)
            ),
            child: const Text('Click'),
          ),
        ),
        const Spacer(flex: 1),//CountdownTimer
        Text('Score: $score', style: const TextStyle(fontSize: 50, color: whiteColor)),
        const Spacer(flex: 1),
      ],
    );
  }
}
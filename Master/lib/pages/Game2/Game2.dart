import 'dart:async';
import 'package:flutter/material.dart';
import 'package:master/pages/event_page.dart';
import '../HomeSolo.dart';
import 'barrier.dart';
import 'bird.dart';
import 'coverscreen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
class Game2 extends StatefulWidget {
  const Game2({Key? key}) : super(key: key);

  @override
  State<Game2> createState() => _Game2State();
}

class _Game2State extends State<Game2> with WidgetsBindingObserver {
  // bird variables
  static double birdY = 0;
  double initialPos = birdY;
  double height = 0;
  final double birdWidth =
      0.1; // out of 2, 2 being the entire width of the screen
  final double birdHeight =
      0.1; // out of 2, 2 being the entire height of the screen

  // game settings
  double time = 0;
  final double gravity = -4.9; // how strong the gravity is
  final double velocity = 3.0; // how strong the jump is
  bool gameHasStarted = false;

  // barrier variables
  static List<double> barrierX = [2, 2 + 1.5];
  static double barrierWidth = 0.5; // out of 2
  List<List<double>> barrierHeight = [
    // out of 2, where 2 is the entire height of the screen
    // [topHeight, bottomHeight]
    [0.6, 0.4],
    [0.4, 0.6],
  ];

//// musique

  final player1 = AudioPlayer();
  final player2 = AudioPlayer();

// score variables
  int score = 0;
  int bestScore = 0;

////////////////////////////////////////
  // Best Score Value Update
  @override
  void initState() {
    super.initState();
    checkBestScore();
    WidgetsBinding.instance?.addObserver(this as WidgetsBindingObserver);
  }

  // Remove Observer
  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this as WidgetsBindingObserver);
    super.dispose();
  }

  // Background Music

  /*@override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    AudioPlayer player = AudioPlayer();
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      player.play('' as Source);
    } else if (state == AppLifecycleState.paused) {
      player.pause();
    } else if (state == AppLifecycleState.inactive) {
      player.pause();
    } else if (state == AppLifecycleState.detached) {
      player.stop();
    }
  }*/

  // Saving Best Score
  getBestScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int bestScore = prefs.getInt('bestScore') ?? 0;
    return bestScore;
  }

  setBestScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('bestScore', bestScore);
  }

  // change musiqc
  void changeMusic(var player, String assetSource) {
    player.stop();
    player.play(AssetSource(assetSource));
  }

///////////////////////////////////
  void startGame() {
    player1.play(AssetSource('audio_player/flagsoung.wav'));

    gameHasStarted = true;
    Timer.periodic(const Duration(milliseconds: 15), (timer) {
      // a real physical jump is the same as an upside down parabola
      // so this is a simple quadratic equation
      height = gravity * time * time + velocity * time;

      setState(() {
        birdY = initialPos - height;
      });

      // check if bird is dead
      if (birdIsDead()) {
        player1.stop();
        player2.play(AssetSource('audio_player/gameover.mp3'));
        timer.cancel();
        _showDialog();
        player2.stop();
      }

      // keep the map moving (move barriers)
      moveMap();

      // keep the time going!
      time += 0.01;
    });
  }

  void moveMap() {
    for (int i = 0; i < barrierX.length; i++) {
      // keep barriers moving
      setState(() {
        barrierX[i] -= 0.005;
      });

      // if barrier exits the left part of the screen, keep it looping
      if (barrierX[i] < -1.5) {
        barrierX[i] += 3;
        ////////////////////
        score++;
        // final player = AudioPlayer();
        // player.play(AssetSource('assets/audio_player/aya.mp3'));
        setBestScore();
        if (score > bestScore) {
          bestScore = score;
        }
        //////////////
      }
    }
  }

  ////////////////////
  checkBestScore() async {
    int tempBestScore = await getBestScore() ?? 0;
    setState(() {
      bestScore = tempBestScore;
    });
  }

  // ////////////////////
  void resetGame() {
    Navigator.pop(context); // dismisses the alert dialog
    setState(() {
      birdY = 0;
      gameHasStarted = false;
      time = 0;
      initialPos = birdY;
      barrierX = [2, 2 + 1.5];
      score = 0;
    });
  }
  void exitGame() {
    Navigator.push(
        context,
        PageRouteBuilder(pageBuilder: (_, __, ___) =>EventPage() )
    );
  }

  void _showDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.brown,
            title: Center(
              child: Text(
                "G A M E  O V E R",
                style: TextStyle(color: Colors.white),
              ),
            ),
            actions: [
              GestureDetector(
                onTap: resetGame,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    padding: EdgeInsets.all(7),
                    color: Colors.white,
                    child: const Text(
                      'PLAY AGAIN',
                      style: TextStyle(color: Colors.brown),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: exitGame,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    padding: EdgeInsets.all(7),
                    color: Colors.white,
                    child: const Text(
                      'EXIT',
                      style: TextStyle(color: Colors.brown),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  void jump() {
    /////////////////////
    final player = AudioPlayer();
    player.play(AssetSource('assets/audio_player/flagsoung.wav'));
    // ////////////////////
    setState(() {
      time = 0;
      initialPos = birdY;
    });
  }

  bool birdIsDead() {
    // check if the bird is hitting the top or the bottom of the screen
    if (birdY < -1 || birdY > 1) {
      return true;
    }

    // hits barriers
    // checks if bird is within x coordinates and y coordinates of barriers
    for (int i = 0; i < barrierX.length; i++) {
      if (barrierX[i] <= birdWidth &&
          barrierX[i] + barrierWidth >= -birdWidth &&
          (birdY <= -1 + barrierHeight[i][0] ||
              birdY + birdHeight >= 1 - barrierHeight[i][1])) {
        return true;
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gameHasStarted ? jump : startGame,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/ciel.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Stack(
                    children: [
                      // bird
                      FlappyBird(
                        birdY: birdY,
                        birdWidth: birdWidth,
                        birdHeight: birdHeight,
                      ),

                      // tap to play
                      CoverScreen(gameHasStarted: gameHasStarted),

                      // Builder(
                      //   builder: (BuildContext context) {
                      //     for (int i = 0; i < barrierX.length; i++) {
                      //       for (int ) {
                      //         return MyBarrier(
                      //         barrierX: barrierX[i],
                      //         barrierWidth: barrierWidth,
                      //         barrierHeight: barrierHeight[i][0],
                      //         isThisBottomBarrier: false,
                      //       );
                      //       }
                      //     }
                      //     return Container();
                      //   },
                      // ),

                      // Top barrier 0
                      Barrier(
                        barrierX: barrierX[0],
                        barrierWidth: barrierWidth,
                        barrierHeight: barrierHeight[0][0],
                        isBottomBarrier: false,
                      ),

                      // Bottom barrier 0
                      Barrier(
                        barrierX: barrierX[0],
                        barrierWidth: barrierWidth,
                        barrierHeight: barrierHeight[0][1],
                        isBottomBarrier: true,
                      ),

                      // Top barrier 1
                      Barrier(
                        barrierX: barrierX[1],
                        barrierWidth: barrierWidth,
                        barrierHeight: barrierHeight[1][0],
                        isBottomBarrier: false,
                      ),

                      // Bottom barrier 1
                      Barrier(
                        barrierX: barrierX[1],
                        barrierWidth: barrierWidth,
                        barrierHeight: barrierHeight[1][1],
                        isBottomBarrier: true,
                      ),

                      ///////
                    ],
                  ),
                ),
              ),
            ),
            /*Container(
              height: 15,
              color: Colors.green,
            ),*/
            Expanded(
              child: Container(
                color: Colors.brown,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            score.toString(),
                            style: const TextStyle(color: Colors.white, fontSize: 35),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'S C O R E',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            bestScore.toString(),
                            style: const TextStyle(color: Colors.white, fontSize: 35),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'B E S T',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





























/*import 'dart:async';


import 'package:flutter/material.dart';
import 'package:gamemaster/pages/Game2/QuizScreen.dart';
import 'package:gamemaster/pages/Game2/bird.dart';


class Game2 extends StatefulWidget {
  const Game2({Key? key}) : super(key: key);

  @override
  State<Game2> createState() => _Game2State();
}

class _Game2State extends State<Game2> {
  static double birdYaxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = birdYaxis ;
  static double barrierXone = 1;
  double barrierXtwo = barrierXone +1.5;
  double score=0;
  double highscore = 0;

  final double gravity = -4.9;
  final double velocity = 3.5;
  bool gameHasStarted = false;

  // barrier variables
  static List<double> barrierX = ;


  void jump(){
    setState(() {
      time = 0;
      initialHeight = birdYaxis;
    });

  }

void startGame() {
  gameHasStarted =  true;
  Timer.periodic(Duration(milliseconds: 60), (timer) {
    time += 0.05;
    height = gravity * time * time + velocity * time;

    setState(() {
      birdYaxis = initialHeight - height;
    });

    setState(() {
      if (barrierXone < -2){
        barrierXone += 3.5;
      }else {
        barrierXone -= 0.05;
      }
    });

    setState(() {
      if (barrierXtwo < -2){
        barrierXtwo += 3.5;
      }else {
        barrierXtwo -= 0.05;
      }
    });

    if (birdYaxis > 1) {
      timer.cancel();
      gameHasStarted = false;
    }
  });
}
void _showDialog() {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.brown,
          title:Center(
            child: Text(
              "G A M E  O V E R",
              style: TextStyle(color: Colors.white),
            ),
          ),
        actions: [
          TextButton(
            child: Text(
              "PLAY AGAIN",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              if (score > highscore) {
                highscore = score;
                initState();
                setState(() {
                  gameHasStarted = false;
                });
                Navigator.of(context).pop();
              }
            }
        )
      ],
    );
      }
  );
}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (gameHasStarted) {
          jump();
        }else {
          startGame();
        }
      },
      child: Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
              child: Stack(
                children: [
                  AnimatedContainer(
                    alignment: Alignment(0,birdYaxis),
                    duration: Duration(milliseconds: 0),
                    color: Colors.blue,
                    child: MyBird(),
                  ),
                  Container(
                    alignment: Alignment(0, -0.3),
                    child:  gameHasStarted
                    ? Text(" ")
                    : Text(" T A P  T O  P L A Y",
                        style:
                            TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barrierXone,1.1),
                      duration: Duration(milliseconds: 0),
                      child: MyBarrier(
                        size: 200.0,
                      ),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barrierXone,-1.1),
                    duration: Duration(milliseconds: 0),
                    child: MyBarrier(
                      size: 200.0,
                    ),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barrierXtwo,1.1),
                    duration: Duration(milliseconds: 0),
                    child: MyBarrier(
                      size: 150.0,
                    ),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barrierXtwo,-1.1),
                    duration: Duration(milliseconds: 0),
                    child: MyBarrier(
                      size: 250.0,
                    ),
                  )
                ],
              )),
          Container(
            height: 15,
              color: Colors.green,
          ),
          Expanded(
              child: Container(
                color: Colors.brown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("SCORE", style: TextStyle(color: Colors.white, fontSize: 15)),
                          SizedBox(height: 20,),
                          Text("0", style: TextStyle(color: Colors.white, fontSize: 35)),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("BEST", style: TextStyle(color: Colors.white, fontSize: 15)),
                          SizedBox(height: 20,),
                          Text("10", style: TextStyle(color: Colors.white, fontSize: 35)),
                        ],
                      ),
                    ],
                )
              ),
          )
        ],
      ),
      )
    );
  }
}

 */

//import 'package:flutter/material.dart';
//import 'dart:async';
//import 'dart:math';

//import 'package:sensors_plus/sensors_plus.dart';
/*
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class Fruit {
  double x;
  double y;
  bool collected;
  Color color;

  Fruit({required this.x, required this.y, this.collected = false, required this.color});

  void updatePosition() {
    y += 5;
  }
}

class _MyAppState extends State<MyApp> {
  double basketXPosition = 0.0;
  double screenWidth = 0.0;
  double screenHeight = 0.0;
  List<Fruit> _fruits = [];
  int score = 30;
  Timer? gameTimer;

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((event) {
      setState(() {
        basketXPosition += event.x * 2.0; // Ajustez la sensibilité ici
        if (basketXPosition < 0) {
          basketXPosition = 0;
        } else if (basketXPosition > screenWidth - 100) {
          basketXPosition = screenWidth - 100;
        }
      });
    });
    Timer.periodic(Duration(seconds: 1), (timer) {
      generateFruit();
    });
    gameTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      updateFruitsPosition();
      checkCollision();
      if (timer.tick >= 120) {
        gameTimer?.cancel();
        showScoreMessage();
      }
    });
  }

  @override
  void dispose() {
    gameTimer?.cancel();
    super.dispose();
  }

  void generateFruit() {
    double x;
    Color color;
    if (Random().nextInt(2) == 0) {
      // Générer à gauche
      x = Random().nextInt(screenWidth ~/ 2).toDouble();
    } else {
      // Générer à droite
      x = Random().nextInt(screenWidth ~/ 2).toDouble() + screenWidth / 2;
    }

    if (Random().nextInt(2) == 0) {
      // Fruit rouge
      color = Colors.red;
    } else {
      // Fruit vert
      color = Colors.green;
    }
    double y = 0;
    Fruit fruit = Fruit(x: x, y: y, color: color);
    setState(() {
      _fruits.add(fruit);
    });
  }

  void updateFruitsPosition() {
    setState(() {
      for (Fruit fruit in _fruits) {
        fruit.updatePosition();
      }
    });
  }

  void checkCollision() {
    for (Fruit fruit in _fruits) {
      if (!fruit.collected &&
          fruit.y >= screenHeight - 100 &&
          fruit.x >= basketXPosition &&
          fruit.x <= basketXPosition + 100) {
        setState(() {
          fruit.collected = true;
          if (fruit.color == Colors.green) {
            score -= 1;
          }
        });
      }
    }
  }

  void showScoreMessage() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
      return AlertDialog(
          title:
          Text('Fin du jeu'),
        content: Text('Votre score final est de $score points.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      );
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            screenWidth = constraints.maxWidth;
            screenHeight = constraints.maxHeight;
            return Stack(
              children: [
                Container(
                  color: Colors.blueGrey[800],
                ),
                for (Fruit fruit in _fruits)
                  if (!fruit.collected)
                    Positioned(
                      top: fruit.y,
                      left: fruit.x,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: fruit.color,
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                Positioned(
                  bottom: 0,
                  left: basketXPosition,
                  child: Image.asset(
                    'assets/images/maincar.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: Text(
                    'Score: $score',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
//import 'package:sensors/sensors.dart';
import 'dart:async';
import 'dart:math';

import 'package:sensors_plus/sensors_plus.dart';

import '../event_page.dart';


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class Fruit {
  double x;
  double y;
  bool collected;
  Color color;
  String photo;

  Fruit({required this.x, required this.y, this.collected = false, required this.color, required this.photo});

  void updatePosition() {
    y += 5;
  }
}

class _MyAppState extends State<MyApp> {
  double basketXPosition = 0.0;
  double screenWidth = 0.0;
  double screenHeight = 0.0;
  List<Fruit> _fruits = [];
  int score = 0;
  Timer? gameTimer;

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((event) {
      setState(() {
        basketXPosition += event.x * 1.5; // Ajustez la sensibilité ici
        if (basketXPosition < 0) {
          basketXPosition = 0;
        } else if (basketXPosition > screenWidth - 100) {
          basketXPosition = screenWidth - 100;
        }
      });
    });
    Timer.periodic(const Duration(milliseconds: 900), (timer) {
      generateFruit();
    });
    gameTimer = Timer.periodic(const Duration(milliseconds:30 ), (timer) {
      updateFruitsPosition();
      checkCollision();
      if (timer.tick >= 1200) {
        gameTimer?.cancel();
        showScoreMessage();
      }
    });
  }
  @override
  void dispose() {
    gameTimer?.cancel();
    super.dispose();
  }
  void generateFruit() {
    double x;
    String photo;
    if (Random().nextInt(2) == 0) {
      // Générer à gauche
      x = Random().nextInt(screenWidth ~/ 2).toDouble();
      photo = 'assets/images/cars/bombe.png'; // Chemin de l'image 1
    } else {
      // Générer à droite
      x = Random().nextInt(screenWidth ~/ 2).toDouble() + screenWidth / 2;
      photo = 'assets/images/cars/image2.png'; // Chemin de l'image 2
    }

    double y = 0;
    Fruit fruit = Fruit(x: x, y: y, color: Colors.transparent, photo: photo);
    setState(() {
      _fruits.add(fruit);
    });
  }



  void updateFruitsPosition() {
    setState(() {
      for (Fruit fruit in _fruits) {
        fruit.updatePosition();
      }
    });
  }

  void checkCollision() {
    for (Fruit fruit in _fruits) {
      if (!fruit.collected &&
          fruit.y >= screenHeight - 100 &&
          fruit.x >= basketXPosition &&
          fruit.x <= basketXPosition + 100) {
        setState(() {
          fruit.collected = true;
          if (fruit.photo == 'assets/images/cars/bombe.png') {
            score -= 1;
          }
          if (fruit.photo == 'assets/images/cars/image2.png') {
            score += 1;
          }
        });
      }
    }
  }

  void showScoreMessage() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Fin du jeu'),
          content: Text('Votre score est de $score points.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(pageBuilder: (_, __, ___) =>EventPage() )
                );
              },
              child: Text('Quitter'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                restartGame();
              },
              child: Text('Reprendre'),
            ),
          ],
        );
      },
    );
  }

  void restartGame() {
    setState(() {
      _fruits.clear();
      score = 30;
      gameTimer = Timer.periodic(Duration(seconds: 1), (timer) {
        updateFruitsPosition();
        checkCollision();
        if (timer.tick >= 120) {
          gameTimer?.cancel();
          showScoreMessage();
        }
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            screenWidth = constraints.maxWidth;
            screenHeight = constraints.maxHeight;
            return Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/cars/bon.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                for (Fruit fruit in _fruits)
                  if (!fruit.collected)
                    Positioned(
                      top: fruit.y,
                      left: fruit.x,
                      child: Image.asset(
                        fruit.photo,
                        width: 50,
                        height: 50,
                      ),
                    ),

                Positioned(
                  bottom: 0,
                  left: basketXPosition,
                  child: Image.asset(
                    'assets/images/cars/pere2.png',
                    width: 120,
                    height: 100,
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green[900],
                      onPrimary: Colors.white,
                      padding: EdgeInsets.all(10),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Score: ${score.toInt()}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),

              ],
            );
          },
        ),
      ),
    );
  }
}










//import 'package:flutter/material.dart';
//import 'package:sensors/sensors.dart';
//import 'dart:async';
//import 'dart:math';

//import 'package:sensors_plus/sensors_plus.dart';
/*
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class Fruit {
  double x;
  double y;
  bool collected;
  //
  Color color;

 // Fruit({required this.x, required this.y, this.collected = false});
  Fruit({required this.x, required this.y, this.collected = false, required this.color});
  void updatePosition() {
    y += 5;
  }
}

class _MyAppState extends State<MyApp> {
  double basketXPosition = 0.0;
  double screenWidth = 0.0;
  double screenHeight = 0.0;
  List<Fruit> _fruits = [];
  int score = 0;
  Timer? gameTimer;

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((event) {
      setState(() {
        basketXPosition += event.x * 2.0; // Ajustez la sensibilité ici
        if (basketXPosition < 0) {
          basketXPosition = 0;
        } else if (basketXPosition > screenWidth - 100) {
          basketXPosition = screenWidth - 100;
        }
      });
    });
    Timer.periodic(Duration(seconds: 1), (timer) {
      generateFruit();
    });
    Timer.periodic(Duration(milliseconds: ), (timer) {
      updateFruitsPosition();
      checkCollision();
      if (timer.tick >= 2400) {
        gameTimer?.cancel();
        showScoreMessage();
      }
    });
  }
  @override
  void dispose() {
    gameTimer?.cancel();
    super.dispose();
  }

  void generateFruit() {
    double x;
    Color color;
    if (Random().nextInt(2) == 0) {
      // Générer à gauche
      x = Random().nextInt(screenWidth ~/ 2).toDouble();
    } else {
      // Générer à droite
      x = Random().nextInt(screenWidth ~/ 2).toDouble() + screenWidth / 2;
    }

    if (Random().nextInt(2) == 0) {
      // Fruit rouge
      color = Colors.red;
    } else {
      // Fruit vert
      color = Colors.green;
    }
    double y = 0;
    Fruit fruit = Fruit(x: x, y: y, color: color);
    setState(() {
      _fruits.add(fruit);
    });
  }

  void updateFruitsPosition() {
    setState(() {
      for (Fruit fruit in _fruits) {
        fruit.updatePosition();
      }
    });
  }

  void checkCollision() {
    for (Fruit fruit in _fruits) {
      if (!fruit.collected &&
          fruit.y >= screenHeight - 100 &&
          fruit.x >= basketXPosition &&
          fruit.x <= basketXPosition + 100) {
        setState(() {
          fruit.collected = true;
          if (fruit.color == Colors.green) {
            score += 1;
          }
        });
      }
    }
  }

  void showScoreMessage() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Fin du jeu'),
            content: Text('Votre score est de $score points.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        }
          );
        }

        @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
        body: LayoutBuilder(
        builder: (context, constraints) {
      screenWidth = constraints.maxWidth;
      screenHeight = constraints.maxHeight;
      return Stack(
        children: [
      Container(
      color: Colors.blueGrey[800],
      ),
          for (Fruit fruit in _fruits)
            if (!fruit.collected)
              Positioned(
                top: fruit.y,
                left: fruit.x,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
          Positioned(
            bottom: 0,
            left: basketXPosition,
            child: Image.asset(
              'assets/images/maincar.png',
              width: 100,
              height: 100,
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: Text(
              'Score: ${score.toInt()}',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      );
        },
        ),
        ),
    );
  }
}
*/

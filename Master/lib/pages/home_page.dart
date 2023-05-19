

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master/pages/Apptest.dart';
import 'package:master/pages/HomeSolo.dart';
import 'package:master/pages/racing.dart';
import 'package:master/pages/PeerTpPeer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'event_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mon application',
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(pageBuilder: (_, __, ___) => JeuxPage())
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      fixedSize: Size(200, 70),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Spécifier le rayon de bordure pour obtenir des bords arrondis
                      ),
                    ),
                    child: const Text('JOUER EN SOLO', ),
                  ),
                  SizedBox(height: 100), // espace vertical entre les boutons
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(pageBuilder: (_, __, ___) => MyHomePage() )
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      fixedSize: Size(200, 70),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Spécifier le rayon de bordure pour obtenir des bords arrondis
                      ),
                    ),
                    child: const Text('JOUER EN DUO'),
                  ),


                  /*ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(pageBuilder: (_, __, ___) => MyApp() )
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      fixedSize: Size(200, 50),
                    ),
                    child: const Text('Bouton 4'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(pageBuilder: (_, __, ___) => MyApp() )
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text('Bouton 4'),
                  ),*/
                ],
              ),
            ),

            /*  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(pageBuilder: (_, __, ___) => EventPage()
                        )
                    );
                  },
                  child: Text('Solo'),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(100, 30),
                    backgroundColor: Colors.purpleAccent,
                  ),
                ),
                SizedBox(width: 30, height: 50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(pageBuilder: (_, __, ___) => HomePage()
                        )
                    );
                  },
                  child: Text('Duo'),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(100, 30),
                    backgroundColor: Colors.purpleAccent,
                  ),
                ),
              ],
            ), */


            /*Positioned(
              top: 440,
              left: 65,
              right: 65,
              row: [
                ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(pageBuilder: (_, __, ___) => EventPage()
                      )
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text('Bouton'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    //  context,
                      //PageRouteBuilder(pageBuilder: (_, __, ___) => )
                      //)
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text('Bouton'),
              ),
    ]
            ),*/
          ],
        ),
      ),
    );
  }
}
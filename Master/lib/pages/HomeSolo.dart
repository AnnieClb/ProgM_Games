import 'package:flutter/material.dart';
import 'package:master/pages/Train/train1.dart';
import 'package:master/pages/event_page.dart';
import 'package:google_fonts/google_fonts.dart';

import 'PeerTpPeer.dart';

class JeuxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(' JOUER EN SOLO', style: GoogleFonts.aboreto(
          textStyle: TextStyle(fontSize: 20),
        ),),



      ),
      body: ListView(
        children: [
          Text(
            "Bienvenue dans l'univers de jeu solo\n"
                'Voici la liste de 6 jeux différents que tu pourras jouer ',
            style: GoogleFonts.cookie(
              textStyle: TextStyle(fontSize: 20),
            ),
          ),
          _buildGameCard(
            title: 'Connais-tu le monde',
            description:
            'C(est un jeu à choix multiple.Un drapeau te seras proposé et tu choisiras le nom du pays parmi 3 réponses qui te seront proposées',
          ),
          _buildGameCard(
            title: 'Flappy Bird',
            description:
            "Flappy bird est un jeu de mouvement qui consiste à dépasser les obstacles en tapotant l'écran afin de ne pas tuer l'oiseau. " ,

          ),
          _buildGameCard(
            title: 'Culture Générale',
            description:
            'Un ensemble de question te seras proposer afin de tester ta culture générale. Grâce au clavier tu proposeras ta réponse.',

          ),
          _buildGameCard(
            title: '1 2 3 Soleil',
            description:
            "Le jeu est inspiré de la série Squid game en un temps recours tu devras cliquer le plus de fois possible sur le compteur afin d'obtenir plus de points.",

          ),
          _buildGameCard(
            title: "C'est noel",
            description:
            'C\'est bientôt collectionnes les girlandes pour construire ton sapin. ATTENTION!! evites les bombes',

          ),
          _buildGameCard(
            title: 'Morpion',
            description:
            'Aligne 3 gadgets de même nature pour gagner',
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(pageBuilder: (_, __, ___) =>Train1() )
              );
              // Action du bouton
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              fixedSize: Size(50, 70),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Spécifier le rayon de bordure pour obtenir des bords arrondis
              ),
            ),
            child: const Text('S\'ENTRAINER'),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(pageBuilder: (_, __, ___) =>EventPage() )
              );
              // Action du bouton
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              fixedSize: Size(70, 70),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Spécifier le rayon de bordure pour obtenir des bords arrondis
              ),
            ),
            child: const Text('JOUER'),
          ),
        ],

      ),
    );
  }

  Widget _buildGameCard({required String title, required String description}) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    title,
                    style: GoogleFonts.lobster(
                      textStyle: TextStyle(
                        //fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.deepPurple[200]
                      ),
                    )
                ),
                SizedBox(height: 8),
                Text(

                  description,
                  style: GoogleFonts.cookie(fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




/*import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../event_page.dart';
class HomeSolo extends StatelessWidget {
  const HomeSolo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game 5'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Bienvenue dans l'univers de jeu solo\n"
                  'Tu découvriras 6 jeux différents jeux qui vont te permettre de d ',
              style: TextStyle(fontSize: 20),
            ),
            const Text(
              "Bienvenue dans l'univers de jeu solo\n"
                  'Tu découvriras 6 jeux ',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => EventPage()
                    )
                );
              },
              child: Text('Jouer'),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(100, 30),
                backgroundColor: Colors.purpleAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
  }
*/
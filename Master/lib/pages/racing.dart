import 'package:flutter/material.dart';

class GamePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[200], // Couleur de fond
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 10), // Bordure verte
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.grey[700], // Couleur de la route
                      ),
                    ),
                    Container(
                      width: 4, // Largeur de la ligne jaune
                      color: Colors.yellow, // Couleur de la ligne jaune
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.grey[700], // Couleur de la route
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

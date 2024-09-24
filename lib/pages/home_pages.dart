import 'package:flutter/material.dart';
import 'package:e_commerce/pages/exploration_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50, // Couleur d'arrière-plan
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Marge autour de l'écran
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Espace entre les sections
          children: [
            Column(
              children: [
                const SizedBox(height: 50), // Espacement du haut
                const Text(
                  "A New Way",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40, // Grande taille du texte principal
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  "To Travel",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40, // Grande taille du texte principal
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Find the best things to do for your trip.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18, // Taille du texte secondaire
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            Image.asset(
              "images/Travelers-cuate.png",
              height: 400, // Taille de l'image ajustée
              fit: BoxFit.contain,
            ),
            SizedBox(
              width: 150,
              height: 60, // Hauteur du bouton
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Exploration');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Couleur du bouton
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Bords arrondis
                  ),
                ),
                child: const Text(
                  "Explore",
                  style: TextStyle(
                    fontSize: 20, // Taille du texte du bouton
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20), // Espace en bas de l'écran
          ],
        ),
      ),
    );
  }
}

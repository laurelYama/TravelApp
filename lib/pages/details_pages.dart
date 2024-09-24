import 'package:flutter/material.dart';

class DestinationDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // L'image commence au début de l'écran
          Container(
            height: 300,
            width: double.infinity,
            child: Image.asset(
              'images/temple.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Contenu de la page
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Espace pour l'image et un contenu surimposé
                SizedBox(height: 240),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Ulun Danu Beratan Temple',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.orange, size: 24),
                              SizedBox(width: 4),
                              Text(
                                '4.6',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.grey),
                          SizedBox(width: 4),
                          Text(
                            'Jl. Raya Candi Kuning, Tabanan',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.directions_walk, color: Colors.grey),
                          SizedBox(width: 4),
                          Text(
                            '3.5 km away',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(width: 16),
                      Row(
                        children: [
                          Icon(Icons.people, color: Colors.grey),
                          SizedBox(width: 4),
                          Text(
                            'Friendly Locals',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Overview',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'This lakeside temple was constructed in honor of Dewi Danu, goddess of the lake that was formed by a volcanic eruption 30,000 years ago.',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Tour Plans',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: 120,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            buildImageCard('images/temple.jpg'),
                            buildImageCard('images/temple.jpg'),
                            buildImageCard('images/temple.jpg'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // AppBar transparent avec icônes avec fond blanc arrondi
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Container(
                margin: EdgeInsets.only(left: 16), // Margins à gauche
                decoration: BoxDecoration(
                  color: Colors.white, // Fond blanc
                  shape: BoxShape.circle, // Forme arrondie
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              actions: [
                Container(
                  margin: EdgeInsets.only(right: 16), // Margins à droite
                  decoration: BoxDecoration(
                    color: Colors.white, // Fond blanc
                    shape: BoxShape.circle, // Forme arrondie
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(Icons.favorite, color: Colors.red),
                    onPressed: () {
                      // Action lors de l'appui sur le bouton favori
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImageCard(String imagePath) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: 120,
          height: 120,
        ),
      ),
    );
  }
}

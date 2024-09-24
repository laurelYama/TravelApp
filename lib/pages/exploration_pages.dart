import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExplorationPage(), // Page principale
    );
  }
}

class ExplorationPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<ExplorationPage> {
  int _selectedIndex = 0; // Index de la page sélectionnée

  final List<Widget> _pages = [
    MenuPage(),
    SearchPage(),
    FavoritePage(),
    NotificationPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: _pages[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: GNav(
          backgroundColor: Colors.grey.shade100,
          color: Colors.black,
          activeColor: Colors.blue,
          tabBackgroundColor: Colors.blue.withOpacity(0.2),
          gap: 8,
          padding: EdgeInsets.all(16),
          selectedIndex: _selectedIndex,
          onTabChange: _onItemTapped,
          tabs: const [
            GButton(icon: Icons.home, text: 'Accueil'),
            GButton(icon: Icons.search, text: 'Recherche'),
            GButton(icon: Icons.favorite, text: 'Favoris'),
            GButton(icon: Icons.notifications, text: 'Notifications'),
          ],
        ),
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Row(
                children: const [
                  Icon(Icons.location_on, color: Colors.blue, size: 24),
                  SizedBox(width: 8),
                  Text(
                    'Bali, Indonesia',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('images/laurel.jpg'),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'Exciting things you',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Text(
                'can do here',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  ActivityCard(imagePath: 'images/wave.png', label: 'Surfing'),
                  ActivityCard(
                      imagePath: 'images/montagne.png', label: 'Hiking'),
                  ActivityCard(
                      imagePath: 'images/camping.png', label: 'Camping'),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Top Sights',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See all',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              SightSlider(
                sights: [
                  SightCard(
                    imageUrl: 'images/temple.jpg',
                    title: 'Ulun Danu Temple',
                    distance: '3.5 km away',
                    rating: 4.6,
                    reviews: 1079,
                  ),
                  SightCard(
                    imageUrl: 'images/R.jpeg',
                    title: 'Uluwatu Temple',
                    distance: '8.8 km away',
                    rating: 4.5,
                    reviews: 979,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Historical Gems',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Recherche de destinations'),
    );
  }
}

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Page des favoris'),
    );
  }
}

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Page des notifications'),
    );
  }
}

class ActivityCard extends StatelessWidget {
  final String imagePath;
  final String label;

  const ActivityCard({
    required this.imagePath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.asset(
            imagePath,
            width: 60,
            height: 60,
          ),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}

class SightCard {
  final String imageUrl;
  final String title;
  final String distance;
  final double rating;
  final int reviews;

  SightCard({
    required this.imageUrl,
    required this.title,
    required this.distance,
    required this.rating,
    required this.reviews,
  });
}

class SightSlider extends StatelessWidget {
  final List<SightCard> sights;

  const SightSlider({required this.sights});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: PageView.builder(
        itemCount: sights.length,
        controller: PageController(viewportFraction: 0.8),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/Details',
                arguments: sights[index],
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.asset(sights[index].imageUrl,
                          fit: BoxFit.cover),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            sights[index].title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.directions_car,
                                      color: Colors.blue, size: 16),
                                  const SizedBox(width: 4),
                                  Text(sights[index].distance),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.star,
                                      color: Colors.amber, size: 16),
                                  const SizedBox(width: 4),
                                  Text(
                                      '${sights[index].rating} (${sights[index].reviews})'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

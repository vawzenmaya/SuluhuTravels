import 'package:flutter/material.dart';
import 'package:travels/screens/dash_board.dart';
import 'package:travels/screens/widgets/bottom_menu.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:travels/screens/trip_page.dart'; // Import TripPage
import 'package:travels/screens/gallery_screen.dart'; // Import GalleryScreen

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _activeIndex = 1;

  // Track the selected category
  String _selectedCategory = '';

  final List<String> imgList = [
    'assets/images/travels.jpg',
    'assets/images/suluhu.jpg',
    'assets/images/umrah.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main body of the app
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80), // Add space for AppBar height
                  _buildCarousel(), // Move carousel here
                  const SizedBox(height: 20),
                  _buildHeroSection(),
                  const SizedBox(height: 20),
                  _buildCategoriesSection(),
                  const SizedBox(height: 6),
                  _buildDealsSection(),
                ],
              ),
            ),
          ),
          // AppBar with rounded corners
          Container(
            height: 75, // Adjust height as necessary
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 141, 29, 29),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
            ),
            child: SafeArea(
              child: AppBar(
                elevation: 0, // Remove default elevation
                backgroundColor: Colors.transparent, // Make background transparent
                title: const Text(
                  'Hi, Yahya',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_active_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomMenu(
        activeIndex: _activeIndex,
        onTap: (index) {
          setState(() {
            _activeIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildCarousel() {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        height: 150.0,
        viewportFraction: 0.85,
      ),
      items: imgList.map((item) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(
            item,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Colors.orangeAccent,
            Colors.deepOrange,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Make It Happen!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            onPressed: () {
              // Navigate to TripPage when button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TripPage()),
              );
            },
            child: const Text(
              'Plan Your Next Trip',
              style: TextStyle(
                fontSize: 18,
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Popular Categories',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCategoryItem(
                icon: Icons.flight_takeoff,
                label: 'Adventure',
                isSelected: _selectedCategory == 'Adventure',
                onPressed: () {
                  setState(() {
                    _selectedCategory = 'Adventure';
                  });
                  // Navigate to TripPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TripPage()),
                  );
                },
              ),
              _buildCategoryItem(
                icon: Icons.travel_explore_outlined,
                label: 'Discover',
                isSelected: _selectedCategory == 'Discover',
                onPressed: () {
                  setState(() {
                    _selectedCategory = 'Discover';
                  });
                  // Navigate to GalleryScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GalleryScreen()),
                  );
                },
              ),
              _buildCategoryItem(
                icon: Icons.volunteer_activism,
                label: 'Donate',
                isSelected: _selectedCategory == 'Donate',
                onPressed: () {
                  setState(() {
                    _selectedCategory = 'Donate';
                  });
                },
              ),
              _buildCategoryItem(
                icon: Icons.wallet,
                label: 'Wallet',
                isSelected: _selectedCategory == 'Wallet',
                onPressed: () {
                  setState(() {
                    _selectedCategory = 'Wallet';
                  });
                  // Navigate to DashboardScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DashboardScreen()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: isSelected ? Colors.deepOrange : Colors.orangeAccent,
            child: Icon(
              icon,
              size: 26,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildDealsSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Deals of the Month',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          _buildDealItem('assets/images/suluhu.jpg', 'Beach Paradise', '50% off'),
        ],
      ),
    );
  }

  Widget _buildDealItem(String imageUrl, String title, String offer) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Image.asset(
              imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    offer,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 128, 69, 69),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

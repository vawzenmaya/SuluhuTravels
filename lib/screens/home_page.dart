import 'package:flutter/material.dart';
import 'package:travels/screens/widgets/bottom_menu.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _activeIndex = 1;

  // Track the pressed state of each icon
  bool _isFlightSelected = false;
  bool _isExploreSelected = false;
  bool _isCitySelected = false;
  bool _isPilgrimageSelected = false;

  final List<String> imgList = [
    'assets/images/travels.jpg',
    'assets/images/suluhu.jpg',
    'assets/images/umrah.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 141, 29, 29),
        title: const Text(
          'Hi, Yahya',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCarousel(),
            const SizedBox(height: 20),
            _buildHeroSection(),
            const SizedBox(height: 20),
            _buildCategoriesSection(),
            const SizedBox(height: 20),
            _buildDealsSection(),
          ],
        ),
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
        height: 200.0,
        viewportFraction: 0.85,
        onPageChanged: (index, reason) {
          setState(() {
            // _currentIndex = index;
          });
        },
      ),
      items: imgList.map((item) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(15),
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Colors.orangeAccent,
              Colors.deepOrange,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Make It Happen!',
              style: TextStyle(
                fontSize: 26,
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
              onPressed: () {},
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
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCategoryItem(
                icon: Icons.flight_takeoff,
                label: 'Adventure',
                isSelected: _isFlightSelected,
                onPressed: () {
                  setState(() {
                    _isFlightSelected = !_isFlightSelected;
                  });
                },
              ),
              _buildCategoryItem(
                icon: Icons.travel_explore_outlined,
                label: 'Discover',
                isSelected: _isExploreSelected,
                onPressed: () {
                  setState(() {
                    _isExploreSelected = !_isExploreSelected;
                  });
                },
              ),
              _buildCategoryItem(
                icon: Icons.volunteer_activism,
                label: 'Donate',
                isSelected: _isCitySelected,
                onPressed: () {
                  setState(() {
                    _isCitySelected = !_isCitySelected;
                  });
                },
              ),
              _buildCategoryItem(
                icon: Icons.place,
                label: 'Pilgrimage',
                isSelected: _isPilgrimageSelected,
                onPressed: () {
                  setState(() {
                    _isPilgrimageSelected = !_isPilgrimageSelected;
                  });
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
              size: 30,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 16)),
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
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                      color: Colors.white,
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

import 'package:flutter/material.dart';
import 'package:travels/screens/dash_board.dart';


class SelectedTrip extends StatelessWidget {
  final String tripImage;
  final String tripTitle;
  final String tripDescription;
  final String tripDate;
  final String tripDuration;
  final String tripPrice;
  final Function(String) onBookNow;

  const SelectedTrip({
    super.key,
    required this.tripImage,
    required this.tripTitle,
    required this.tripDescription,
    required this.tripDate,
    required this.tripDuration,
    required this.tripPrice,
    required this.onBookNow,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tripTitle),
        backgroundColor: const Color.fromARGB(255, 141, 29, 29),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Trip Image
            Image.asset(
              tripImage,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            // Trip Details
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Title
                  Text(
                    tripTitle,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Description
                  Text(
                    tripDescription,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Date and Duration
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, color: Colors.blueAccent),
                      const SizedBox(width: 8),
                      Text(
                        'Date: $tripDate',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.access_time, color: Colors.blueAccent),
                      const SizedBox(width: 8),
                      Text(
                        'Duration: $tripDuration',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Price
                  Text(
                    'Price: $tripPrice',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Booking Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashboardScreen(tripName: tripTitle), // Pass the trip name
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      backgroundColor: const Color.fromARGB(255, 141, 29, 29),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Book Now',
                      style: TextStyle(fontSize: 20),
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

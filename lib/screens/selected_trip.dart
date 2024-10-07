import 'package:flutter/material.dart';
import 'package:travels/screens/chat_page.dart'; // Import the ChatPage
import 'package:travels/screens/dash_board.dart'; // Import the DashboardScreen

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
                      color: Color.fromARGB(235, 218, 167, 92),
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
                      const Icon(Icons.access_time, color: Color.fromARGB(255, 67, 115, 247)),
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
                      // Show the booking dialog with payment options
                      _showBookingDialog(context, tripTitle);
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

  // Booking Dialog Method
  void _showBookingDialog(BuildContext context, String tripName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BookingDialog(tripName: tripName); // Call the new BookingDialog widget
      },
    );
  }
}

// Booking Dialog Widget
class BookingDialog extends StatefulWidget {
  final String tripName;

  const BookingDialog({super.key, required this.tripName});

  @override
  _BookingDialogState createState() => _BookingDialogState();
}

class _BookingDialogState extends State<BookingDialog> {
  String? _selectedPaymentOption; // Store selected payment option

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent, // Make the AlertDialog background transparent
      content: Container(
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
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 15,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.1),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Confirm Booking',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'How would you like to pay for ${widget.tripName}?',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 12),
              // Option 1: Pay Full Amount
              ListTile(
                title: const Text('Full Amount', style: TextStyle(color: Colors.white)),
                leading: Radio<String>(
                  value: 'full',
                  groupValue: _selectedPaymentOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedPaymentOption = value; // Update selection
                    });
                    // Navigate to ChatPage immediately upon selection
                    if (value == 'full') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChatPage(),
                        ),
                      );
                    }
                  },
                ),
                onTap: () {
                  setState(() {
                    _selectedPaymentOption = 'full'; // Update selection
                  });
                  // Navigate to ChatPage immediately on tap
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChatPage(),
                    ),
                  );
                },
              ),
              // Option 2: Pay in Installments
              ListTile(
                title: const Text('Installments', style: TextStyle(color: Colors.white)),
                leading: Radio<String>(
                  value: 'installments',
                  groupValue: _selectedPaymentOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedPaymentOption = value; // Update selection
                    });
                    // Navigate to DashboardScreen immediately upon selection
                    if (value == 'installments') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DashboardScreen(),
                        ),
                      );
                    }
                  },
                ),
                onTap: () {
                  setState(() {
                    _selectedPaymentOption = 'installments'; // Update selection
                  });
                  // Navigate to DashboardScreen immediately on tap
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DashboardScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            // If desired, you can keep this to double-confirm navigation
            if (_selectedPaymentOption != null) {
              Navigator.of(context).pop(); // Close the dialog after navigation
            } else {
              // Show alert if no payment option is selected
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please select a payment option.')),
              );
            }
          },
          child: const Text('Confirm'), // Keep this if you want an explicit confirmation
        ),
      ],
    );
  }
}

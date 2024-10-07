import 'package:flutter/material.dart';
import 'package:travels/screens/chat_page.dart';
import 'package:travels/screens/dash_board.dart';

class SelectionProcessPage extends StatefulWidget {
  final String tripName; // Add tripName as a parameter

  const SelectionProcessPage({super.key, required this.tripName}); // Require tripName in constructor

  @override
  _SelectionProcessPageState createState() => _SelectionProcessPageState();
}

class _SelectionProcessPageState extends State<SelectionProcessPage> {
  String? _selectedPaymentOption;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Set a fixed height for the dialog content
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How would you like to pay for ${widget.tripName}?', // Use tripName in the body
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          // Option 1: Pay Full Amount
          ListTile(
            title: const Text('Pay Full Amount'),
            leading: Radio<String>(
              value: 'full',
              groupValue: _selectedPaymentOption,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentOption = value;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChatPage(),
                  ),
                );
              },
            ),
            onTap: () {
              setState(() {
                _selectedPaymentOption = 'full';
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatPage(),
                ),
              );
            },
          ),
          // Option 2: Pay in Installments
          ListTile(
            title: const Text('Pay in Installments'),
            leading: Radio<String>(
              value: 'installments',
              groupValue: _selectedPaymentOption,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentOption = value;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DashboardScreen(),
                  ),
                );
              },
            ),
            onTap: () {
              setState(() {
                _selectedPaymentOption = 'installments';
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DashboardScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

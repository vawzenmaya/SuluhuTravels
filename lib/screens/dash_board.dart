import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  final String? tripName; // Allow tripName to be nullable

  const DashboardScreen({super.key, this.tripName});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  double _currentBalance = 500.00; // Initial balance
  final double _targetAmount = 1000.00; // Set a target goal for the trip
  final TextEditingController _amountController = TextEditingController();
  List<double> _recentDeposits = []; // List to store recent deposits

  void _addMoney() {
    setState(() {
      double amountToAdd = double.tryParse(_amountController.text) ?? 0.0;
      _currentBalance += amountToAdd;
      if (amountToAdd > 0) {
        _recentDeposits.add(amountToAdd); // Add deposit to recent deposits
      }
      _amountController.clear();
    });
  }

  double _calculateProgress() {
    return _currentBalance / _targetAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 141, 29, 29),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container displaying trip name, current balance, target amount, and progress bar
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(246, 239, 216, 142),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.tripName != null
                          ? 'Saving for: ${widget.tripName}' // Show the trip name if available
                          : 'No trip selected yet!', // Show message if no trip selected
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Current Balance display
                    Text(
                      'Current Balance: \$$_currentBalance',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 91, 54, 54),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Target Amount display
                    Text(
                      'Target: \$$_targetAmount',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 91, 54, 54),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Progress Bar
                    LinearProgressIndicator(
                      value: _calculateProgress(),
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        _calculateProgress() < 1.0 ? Colors.orange : Colors.green,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Progress Percentage
                    Text(
                      'Progress: ${(_calculateProgress() * 100).toStringAsFixed(1)}%',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // App Icon Image
                    Center(
                      child: Image.asset(
                        'assets/icons/app_icon.png', // Replace with your icon path
                        height: 80, // Adjust the size of the icon
                        width: 80,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Input field to add money
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Amount',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Buttons for adding money
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _addMoney,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Text('Deposit Money'),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Recent Deposits List Section
              const Text(
                'Recent Deposits',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // Display recent deposits or a message if no records yet
              _recentDeposits.isNotEmpty
                  ? SizedBox(
                      height: 200, // Adjust the height as needed
                      child: ListView.builder(
                        itemCount: _recentDeposits.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: const Icon(Icons.monetization_on, color: Colors.green),
                            title: Text('\$${_recentDeposits[index].toStringAsFixed(2)}'),
                            subtitle: Text('Deposit ${index + 1}'),
                          );
                        },
                      ),
                    )
                  : const Center(
                      child: Text(
                        'No records yet',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

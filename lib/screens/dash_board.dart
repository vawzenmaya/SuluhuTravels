import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardScreen extends StatefulWidget {
  final String? tripName; // Allow tripName to be nullable

  const DashboardScreen({super.key, this.tripName});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  double _currentBalance = 500.00; // Initial balance
  final TextEditingController _amountController = TextEditingController();

  void _addMoney() {
    setState(() {
      double amountToAdd = double.tryParse(_amountController.text) ?? 0.0;
      _currentBalance += amountToAdd;
      _amountController.clear();
    });
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
              // Trip Name Display
              Text(
                widget.tripName != null
                    ? 'Saving for: ${widget.tripName}' // Show the trip name if available
                    : 'No trip selected yet!', // Show message if no trip selected
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),

              // Section to view current balance
              const Text(
                'Current Balance',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(246, 239, 216, 142),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$$_currentBalance',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 91, 54, 54),
                      ),
                    ),
                    const Icon(
                      Icons.account_balance_wallet,
                      size: 40,
                      color: Color.fromARGB(255, 45, 104, 231),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Input field to add/remove money
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Amount',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Buttons for adding and removing money
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

              // Pie Chart Section
              const Text(
                'Deposit Distribution',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const SizedBox(
                height: 200,
                child: PieChartWidget(),
              ),
              const SizedBox(height: 30),

              // Bar Graph Section
              const Text(
                'Monthly Deposit Breakdown',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const SizedBox(
                height: 200,
                child: BarGraphWidget(),
              ),
              const SizedBox(height: 32),

              // Line Graph Section
              const Text(
                'Deposit Progress Over Time',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const SizedBox(
                height: 200,
                child: LineGraphWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Pie Chart Implementation
class PieChartWidget extends StatelessWidget {
  const PieChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            value: 40,
            color: Colors.green,
            title: '40%',
            radius: 50,
          ),
          PieChartSectionData(
            value: 30,
            color: Colors.orange,
            title: '30%',
            radius: 50,
          ),
          PieChartSectionData(
            value: 30,
            color: Colors.red,
            title: '30%',
            radius: 50,
          ),
        ],
        sectionsSpace: 4,
        centerSpaceRadius: 40,
      ),
    );
  }
}

// Bar Graph Implementation
class BarGraphWidget extends StatelessWidget {
  const BarGraphWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barGroups: [
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(
                toY: 8,
                color: Colors.blue,
                width: 16,
              ),
            ],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(
                toY: 10,
                color: Colors.blue,
                width: 16,
              ),
            ],
          ),
          BarChartGroupData(
            x: 3,
            barRods: [
              BarChartRodData(
                toY: 6,
                color: Colors.red,
                width: 16,
              ),
            ],
          ),
          BarChartGroupData(
            x: 4,
            barRods: [
              BarChartRodData(
                toY: 12,
                color: Colors.green,
                width: 16,
              ),
            ],
          ),
        ],
        titlesData: const FlTitlesData(show: true),
      ),
    );
  }
}

// Line Graph Implementation
class LineGraphWidget extends StatelessWidget {
  const LineGraphWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: [
              const FlSpot(0, 1),
              const FlSpot(1, 3),
              const FlSpot(2, 2),
              const FlSpot(3, 5),
              const FlSpot(4, 3),
              const FlSpot(5, 4),
            ],
            isCurved: true,
            color: Colors.green,
            barWidth: 4,
            isStrokeCapRound: true,
            belowBarData: BarAreaData(show: true, color: Colors.green.withOpacity(0.3)),
          ),
        ],
      ),
    );
  }
}

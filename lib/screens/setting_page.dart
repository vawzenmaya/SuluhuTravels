import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travels/screens/widgets/theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 141, 29, 29), Color.fromARGB(255, 141, 29, 29)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: const Text('Settings', style: TextStyle(color: Colors.white),),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 150,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 141, 29, 29), Color.fromARGB(255, 141, 29, 29)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              // Positioned CircleAvatar
              Positioned(
                top: 100, // This will push the avatar 50% on the white part below
                left: MediaQuery.of(context).size.width / 2 - 50, // Center horizontally
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: const AssetImage('assets/images/maguy.jpg'),
                  backgroundColor: Colors.white,
                  // Optional: Add a border around the image
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 4), // White border
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ],
          ),
          
          // Space for the overlapping profile picture
          const SizedBox(height: 70), // Adjust to move content down

          // User Info
          const Text(
            'Yahya',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            'Yahya@gmail.com',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 20),

          // Account Actions
          ListTile(
            leading: const Icon(Icons.lock, color: Colors.blue),
            title: const Text('Change Password'),
            onTap: () {
              // Change password functionality
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.delete, color: Colors.blue),
            title: const Text('Delete User Account'),
            onTap: () {
              // Delete account functionality
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.blue),
            title: const Text('Logout'),
            onTap: () {
              // Logout functionality
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.brightness_6, color: Colors.blue),
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: themeProvider.themeMode == ThemeMode.dark,
              onChanged: (value) {
                themeProvider.toggleTheme(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}

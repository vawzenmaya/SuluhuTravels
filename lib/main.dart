import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travels/screens/widgets/splas.dart';
import 'package:travels/screens/widgets/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Suluhu Travels',
      theme: ThemeData(fontFamily: 'Poppins'),
      darkTheme: ThemeData.dark(),
      themeMode: themeProvider.themeMode,
      home: SplashScreen(),  // Set SplashScreen as the home
    );
  }
}

import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

// --- Global Colors ---
const Color kBackground = Color(0xFFF5EFE6);
const Color kPrimary = Color(0xFF4A6B4A);
const Color kAccent = Color(0xFFC7A760);
const Color kShadowLight = Colors.white;
const Color kShadowDark = Color(0xFFA3A3A3);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhisperSense',
      theme: ThemeData(
        fontFamily: 'Georgia',
        scaffoldBackgroundColor: kBackground,
        appBarTheme: const AppBarTheme(
          backgroundColor: kBackground,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: kPrimary,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}

// --- Stylish Landing Page ---
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("WhisperSense")),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo + Tagline
            const Icon(
              Icons.psychology_alt_rounded,
              size: 100,
              color: kPrimary,
            ),
            const SizedBox(height: 20),
            const Text(
              "Truth. Simplified.",
              style: TextStyle(
                fontSize: 20,
                color: kPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 40),

            // Neumorphic Button
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ImperialHomePage(),
                ),
              ),
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kBackground,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: kShadowDark.withOpacity(0.3),
                      offset: const Offset(5, 5),
                      blurRadius: 10,
                    ),
                    const BoxShadow(
                      color: kShadowLight,
                      offset: Offset(-5, -5),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "Enter the Briefing Room",
                    style: TextStyle(
                      color: kPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 50),
            const Text(
              "Analyze truth across the world with AI intelligence.\nPowered by WhisperSense.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

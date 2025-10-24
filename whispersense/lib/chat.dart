import 'package:flutter/material.dart';

// --- Theme Colors ---
const Color _kParchmentBackground = Color(0xFFF7F1E5); // Aged paper/Cream
const Color _kDeepGreen = Color(0xFF4A6B4A); // Deep Forest Green (Header/Borders)
const Color _kMutedGold = Color(0xFFC7A760); // Muted Gold/Brass (Accents)
const Color _kLightParchment = Color(0xFFFFFFFF); // Slightly lighter internal card background

class AIChatbotScreen extends StatelessWidget {
  const AIChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _kParchmentBackground,
      // SafeArea ensures content doesn't overlap status bars/notches
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              // --- Main Chat Window Card ---
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: _kLightParchment, // Inner card background
                    borderRadius: BorderRadius.circular(8.0),
                    // subtle shadow for depth
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // --- Chat Header ---
                      _buildChatHeader(),
                      // --- Chat History Area (Empty for now) ---
                      const Expanded(
                        child: Center(
                          child: Text(
                            "Waiting for Imperial Query...",
                            style: TextStyle(
                              fontFamily: 'Georgia',
                              color: Colors.black54,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                      // --- Chat Input Field (Docked) ---
                      _buildChatInputField(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Widget Builders ---

  Widget _buildChatHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: const BoxDecoration(
        color: _kDeepGreen,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text(
            "AI Chatbot",
            style: TextStyle(
              fontFamily: 'Georgia',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: _kParchmentBackground, // Cream text on dark green
            ),
          ),
          // Stylized Book/Checkmark Icon
          Icon(
            Icons.book, // Using a standard book icon
            color: _kMutedGold,
            size: 24,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 2,
                offset: const Offset(1, 1),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChatInputField() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: _kMutedGold, width: 1.5), // Gold border
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: <Widget>[
              // Input Field
              Expanded(
                child: TextField(
                  // 'Typp message' placeholder changed to English
                  decoration: InputDecoration(
                    hintText: "Type Imperial message...", 
                    hintStyle: TextStyle(
                      color: Colors.black54,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Georgia',
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  ),
                  style: TextStyle(fontFamily: 'Georgia', color: Colors.black),
                ),
              ),
              // Send/Paper Plane Icon
              Transform.rotate(
                angle: -0.7, // Rotate to look like a paper plane icon
                child: const Icon(
                  Icons.send,
                  color: _kMutedGold,
                  size: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- Main function to run the app (for testing purposes) ---
/*
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Imperial Briefing Command Chat',
      theme: ThemeData(
        fontFamily: 'Georgia', 
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: _kParchmentBackground,
        useMaterial3: true,
      ),
      home: const AIChatbotScreen(),
    );
  }
}
*/
import 'package:flutter/material.dart';

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the primary color (olive green) and secondary color (light parchment)
    const Color primaryColor = Color(0xFF6B8E23); // Olive Green
    const Color backgroundColor = Color(0xFFFAF9F6); // Off-White/Parchment

    return MaterialApp(
      title: 'Welcome Back',
      // We'll manage the overall theme in the stateful page for the light/dark toggle
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: primaryColor,
          background: backgroundColor,
        ),
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

// --- LOGIN PAGE WIDGET ---

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // State for the Light/Dark Mode toggle (though the UI is currently only themed light)
  bool _isLightMode = true;

  // Define colors based on the image's aesthetic
  final Color _primaryColor = const Color(0xFF6B8E23); // Dark Olive
  final Color _accentColor = const Color(0xFFB5A76C); // Muted Gold/Brown
  final Color _cardColor = Colors.white; // Card background
  final Color _backgroundColor = const Color(
    0xFFFBFBF4,
  ); // Creamy/Parchment background

  @override
  Widget build(BuildContext context) {
    // Update theme based on state (optional, for future dark mode implementation)
    // For this implementation, the colors are mostly fixed to match the image.

    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // The main login card
              Container(
                width: 400, // Max width for desktop/tablet view
                decoration: BoxDecoration(
                  color: _cardColor,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 0,
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // 1. Header (Welcome Back)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      decoration: BoxDecoration(
                        color: _primaryColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0),
                        ),
                      ),
                      child: const Text(
                        'Welcome Back',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),

                    // 2. Body Content
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Book Icon
                          Icon(
                            Icons
                                .menu_book, // Placeholder for the custom book icon
                            size: 64,
                            color: _primaryColor,
                          ),
                          const SizedBox(height: 32),

                          // Username Field
                          _buildCustomTextField(
                            hintText: 'Username',
                            icon: Icons.edit, // Placeholder for feather
                          ),
                          const SizedBox(height: 16),

                          // Password Field
                          _buildCustomTextField(
                            hintText: 'Password',
                            icon: Icons.key_outlined, // Placeholder for key
                            isPassword: true,
                          ),
                          const SizedBox(height: 32),

                          // Sign in with Google Button
                          _buildGoogleSignInButton(),
                          const SizedBox(height: 16),

                          // Forgot Password
                          TextButton(
                            onPressed: () {
                              // Action for Forgot Password
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ),

                          // Don't have an account
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have de account? : ",
                                style: TextStyle(color: Colors.grey[800]),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Action for Sign Up/Uijp
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: const Size(0, 0),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text(
                                  'Uijp', // Assuming this is the Sign Up link
                                  style: TextStyle(
                                    color: _primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 48),

              // 3. Light Mode Toggle
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wb_sunny_outlined, color: Colors.grey[700]),
                  const SizedBox(width: 8),
                  Text(
                    _isLightMode ? 'Light Mode' : 'Dark Mode',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 8),
                  Switch(
                    value: _isLightMode,
                    onChanged: (bool value) {
                      setState(() {
                        _isLightMode = value;
                        // In a real app, this would trigger a theme change.
                      });
                    },
                    activeColor: _primaryColor,
                    inactiveTrackColor: Colors.grey[300],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget to build the custom text fields
  Widget _buildCustomTextField({
    required String hintText,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: TextField(
        obscureText: isPassword,
        style: const TextStyle(fontSize: 18),
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none, // Removes the default underline
          isDense: true,
          contentPadding: EdgeInsets.zero,
          suffixIcon: Icon(icon, color: _accentColor, size: 20),
        ),
      ),
    );
  }

  // Helper widget for the Google Sign-in button
  Widget _buildGoogleSignInButton() {
    return OutlinedButton(
      onPressed: () {
        // Google Sign-in action
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.grey.shade800,
        backgroundColor: Colors.white,
        side: BorderSide(color: Colors.grey.shade300),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 1, // Slight elevation to match the image
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Google 'G' icon (using a generic one for simplicity)
          Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1024px-Google_%22G%22_logo.svg.png',
            height: 20,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.g_mobiledata, size: 28, color: Colors.blue),
          ),
          const SizedBox(width: 12),
          const Text(
            'Sign in with Google',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

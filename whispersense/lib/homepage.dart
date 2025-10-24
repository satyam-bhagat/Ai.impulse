import 'package:flutter/material.dart';
import 'overvirew.dart';
import 'chat.dart';

// Function to create a MaterialColor from a single Color (useful for primarySwatch)
// (Copied from previous file for completeness)
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - r)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

class ImperialHomeApp extends StatelessWidget {
  const ImperialHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Imperial Home',
      theme: ThemeData(
        fontFamily: 'Georgia', // Consistent classic/serif font
        scaffoldBackgroundColor: const Color(
          0xFFFBF8E0,
        ), // Light parchment color
        colorScheme:
            ColorScheme.fromSwatch(
              primarySwatch: createMaterialColor(
                const Color(0xFF38633D),
              ), // Olive/Darker Green
            ).copyWith(
              secondary: const Color(0xFF964B00), // Brown accent
            ),
        useMaterial3: true,
      ),
      home: const ImperialHomePage(),
    );
  }
}

class ImperialHomePage extends StatelessWidget {
  const ImperialHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // A subtle patterned background to match the image texture (optional)
    final Color backgroundColor = const Color(0xFFFBF8E0);

    return Scaffold(
      backgroundColor: backgroundColor,
      // Custom AppBar to match the header design
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).colorScheme.primary, // Olive/Dark Green bar
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Home Page',
                    style: TextStyle(
                      color: Color(0xFFFBF8E0), // Parchment text color
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // The Checkmark & Book Icon (e.g., for 'Read' or 'Done')
                  Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: const Color(
                        0xFFFBF8E0,
                      ), // Parchment background for icon
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.check_box_outlined, // Checkmark
                      color: Color(0xFF38633D), // Dark Green
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // List of Article Cards
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: 8, // Just a number to fill the screen
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: ArticleCard(
              onTap: () {
                if (index == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OverviewScreen(),
                    ),
                  );
                } else if (index == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TruthReportScreen(),
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}

// Widget for a single article entry
class ArticleCard extends StatelessWidget {
  final VoidCallback? onTap;

  const ArticleCard({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(
            0xFFE9E4C0,
          ), // Slightly darker parchment for the card
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xFFD4D0B5), // Subtle border
            width: 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Placeholder for the article image
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[300], // Grey placeholder
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(width: 12),
            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    'Headline of the News Article',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C3D2E), // Dark text color
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Subtitle or Brief Description',
                    style: TextStyle(fontSize: 14, color: Color(0xFF4C3D2E)),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Source: Unknown',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFFA0997F), // Lighter grey for metadata
                    ),
                  ),
                  Text(
                    'Date: Today',
                    style: TextStyle(fontSize: 12, color: Color(0xFFA0997F)),
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

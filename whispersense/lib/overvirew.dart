import 'package:flutter/material.dart';
import 'dart:math' as math;

// --- Theme Colors ---
const Color _kParchmentBackground = Color(0xFFF7F1E5); // Aged paper/Cream
const Color _kDeepGreen = Color(0xFF4A6B4A); // Deep Forest Green (Text/Accents)
const Color _kMutedGold = Color(0xFFC7A760); // Muted Gold/Brass (Accents/Icons)
const Color _kTruthGreen = Color(0xFF386538); // Darker Green for the Pie Chart's "Truth" segment
const Color _kMisinfoBlue = Color(0xFF708090); // Muted Blue/Gray for "Misinformation" segment

class TopicReportCard extends StatelessWidget {
  const TopicReportCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _kParchmentBackground,
      // SafeArea ensures content doesn't overlap status bars/notches
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Container(
            // The central card on the parchment background
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.95), // Slightly lighter white for the card itself
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: _kDeepGreen.withOpacity(0.5), width: 1.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // --- Top Header Section ---
                _buildReportHeader(),
                const SizedBox(height: 20),

                // --- Topic Title ---
                const Text(
                  "Topic: Middle East Ceasefire Talks",
                  style: TextStyle(
                    fontFamily: 'Georgia',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: _kDeepGreen,
                  ),
                  textAlign: TextAlign.center,
                ),
                // Sub-text for navigation
                const Text(
                  "< Back to Query / Home",
                  style: TextStyle(
                    fontFamily: 'Georgia',
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                // --- Pie Chart Section (Truth vs. Misinformation) ---
                _buildPieChartSection(context),
                const SizedBox(height: 30),

                // --- Summary Section ---
                _buildSummarySection(),
                const SizedBox(height: 40),

                // --- Read More Button ---
                _buildReadMoreButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- Widget Builders ---

  Widget _buildReportHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // Left Icon (Checked Book)
        Icon(
          Icons.book, // Using a book icon
          color: _kMutedGold,
          size: 32,
          shadows: [
            Shadow(
              color: _kDeepGreen.withOpacity(0.7),
              blurRadius: 2,
              offset: const Offset(1, 1),
            )
          ],
        ),
        // Right Icon (Settings Gear)
        Icon(
          Icons.settings,
          color: _kMutedGold,
          size: 30,
        ),
      ],
    );
  }

  Widget _buildPieChartSection(BuildContext context) {
    // Assuming Truth is 85% and Misinformation is 15% based on visual proportions
    const double truthPercentage = 0.85;
    const double misinfoPercentage = 0.15;
    
    return Center(
      child: SizedBox(
        height: 180,
        width: 180,
        child: CustomPaint(
          painter: _PieChartPainter(
            percentages: [truthPercentage, misinfoPercentage],
            colors: [_kTruthGreen, _kMisinfoBlue],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Labels positioned outside the chart, based on image
                const Positioned(
                  top: 50, // Approximate position
                  left: 0,
                  child: Text("Truth", style: TextStyle(color: _kDeepGreen, fontFamily: 'Georgia')),
                ),
                const Positioned(
                  top: 50,
                  right: 0,
                  child: Text("Misinfo", style: TextStyle(color: _kDeepGreen, fontFamily: 'Georgia')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSummarySection() {
    // Using placeholder text to match the appearance of the image's text structure
    const String placeholderSummary = 
        "Latest intelligence suggests negotiations for a UN-backed ceasefire have full momentum, and a prisoner exchange is currently unified by key parties.";
        
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "Summary",
          style: TextStyle(
            fontFamily: 'Georgia',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: _kDeepGreen,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          placeholderSummary,
          style: const TextStyle(
            fontFamily: 'Georgia',
            fontSize: 16,
            color: Colors.black87,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildReadMoreButton() {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.black54, width: 1.0),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: const Text(
          "Read More",
          style: TextStyle(
            fontFamily: 'Georgia',
            fontSize: 16,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// Custom Painter for the Pie Chart
class _PieChartPainter extends CustomPainter {
  final List<double> percentages;
  final List<Color> colors;

  _PieChartPainter({required this.percentages, required this.colors});

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = size.width / 2;
    double startAngle = -math.pi / 2; // Start from the top

    for (int i = 0; i < percentages.length; i++) {
      final sweepAngle = 2 * math.pi * percentages[i];
      final paint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.fill;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        true,
        paint,
      );
      startAngle += sweepAngle;
    }

    // Draw the subtle border around the chart
    final borderPaint = Paint()
      ..color = _kDeepGreen.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    canvas.drawCircle(center, radius, borderPaint);
    
    // Attempt to approximate the labels from the image's position relative to the chart
    final textPainterTruth = TextPainter(
      text: const TextSpan(text: "Truth", style: TextStyle(color: _kDeepGreen, fontFamily: 'Georgia', fontSize: 13)),
      textDirection: TextDirection.ltr,
    );
    textPainterTruth.layout();
    textPainterTruth.paint(canvas, Offset(center.dx - radius - 15, center.dy - 10)); // Position to the left

    final textPainterMisinfo = TextPainter(
      text: const TextSpan(text: "Misinfo", style: TextStyle(color: _kDeepGreen, fontFamily: 'Georgia', fontSize: 13)),
      textDirection: TextDirection.ltr,
    );
    textPainterMisinfo.layout();
    textPainterMisinfo.paint(canvas, Offset(center.dx + radius + 5, center.dy - 10)); // Position to the right
  }

  @override
  bool shouldRepaint(_PieChartPainter oldDelegate) {
    return oldDelegate.percentages != percentages || oldDelegate.colors != colors;
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
      title: 'Imperial Briefing Command Report',
      theme: ThemeData(
        fontFamily: 'Georgia', 
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: _kParchmentBackground,
        useMaterial3: true,
      ),
      home: const TopicReportCard(),
    );
  }
}
*/
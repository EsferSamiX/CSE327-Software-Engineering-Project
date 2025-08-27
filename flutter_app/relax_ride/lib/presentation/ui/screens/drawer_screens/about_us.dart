import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Us',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal.shade600,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/logo.png'),
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(height: 20),
            Text(
              'Relax Ride',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade800,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Your Journey, Our Priority',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 30),

            _buildInfoCard(
              icon: Icons.rocket_launch,
              title: 'Our Mission',
              content: 'To provide seamless, comfortable, and reliable bus booking services across Bangladesh, making travel accessible and enjoyable for everyone.',
            ),

            _buildInfoCard(
              icon: Icons.visibility,
              title: 'Our Vision',
              content: 'To become the leading digital platform for transportation services in Bangladesh, connecting people and places with trust and efficiency.',
            ),

            _buildInfoCard(
              icon: Icons.star,
              title: 'Why Choose Us?',
              content: '• Easy online booking\n• Real-time bus tracking\n• Secure payment options\n• 24/7 customer support\n• Competitive pricing\n• Wide network of operators',
            ),

            _buildInfoCard(
              icon: Icons.history,
              title: 'Our Story',
              content: 'Founded in 2024, Relax Ride started with a simple goal: to make bus travel in Bangladesh more convenient and reliable. Today, we serve thousands of passengers daily across major routes.',
            ),

            const SizedBox(height: 20),
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade800,
              ),
            ),
            const SizedBox(height: 15),
            _buildContactInfo(Icons.email, 'Email', 'support@relaxride.com'),
            _buildContactInfo(Icons.phone, 'Phone', '+8801612939330'),
            _buildContactInfo(Icons.location_on, 'Address', 'Dhaka, Bangladesh'),

            const SizedBox(height: 30),
            const Text(
              '© 2025 Relax Ride. All rights reserved.',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({required IconData icon, required String title, required String content}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 3,
      color: Colors.teal.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, size: 40, color: Colors.teal.shade600),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade800,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              content,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.teal.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo(IconData icon, String type, String info) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.teal.shade600),
          const SizedBox(width: 10),
          Text(
            '$type: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.teal.shade800,
            ),
          ),
          Text(
            info,
            style: TextStyle(color: Colors.teal.shade700),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TermsNConditions extends StatefulWidget {
  const TermsNConditions({super.key});

  @override
  State<TermsNConditions> createState() => _TermsNConditionsState();
}

class _TermsNConditionsState extends State<TermsNConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms & Conditions'),
        backgroundColor: Colors.teal.shade600,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Last Updated: August 2025',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 20),

            _buildSection('1. Acceptance of Terms',
                'By using Relax Ride services, you agree to be bound by these Terms and Conditions. Please read them carefully before using our platform.'),

            _buildSection('2. Services Description',
                'Relax Ride provides bus booking services, allowing users to search, book, and manage bus tickets for various destinations across Bangladesh.'),

            _buildSection('3. User Account',
                '• You must provide accurate information during registration\n• You are responsible for maintaining account confidentiality\n• You must be at least 18 years old to create an account\n• You agree to notify us immediately of any unauthorized use'),

            _buildSection('4. Booking and Payments',
                '• All bookings are subject to availability\n• Payments are processed through secure payment gateways\n• Prices are subject to change without notice\n• Cancellation policies vary by service provider'),

            _buildSection('5. Cancellation Policy',
                '• Cancellations made 24 hours before departure: 80% refund\n• Cancellations made 12 hours before departure: 50% refund\n• Cancellations made less than 12 hours: no refund\n• Refunds are processed within 7-10 business days'),

            _buildSection('6. User Conduct',
                'You agree not to use the service for any unlawful purpose or to violate any laws in your jurisdiction. Any fraudulent activity will result in immediate account termination.'),

            _buildSection('7. Intellectual Property',
                'All content, logos, and materials on Relax Ride are protected by copyright and other intellectual property laws. You may not use our content without permission.'),

            _buildSection('8. Limitation of Liability',
                'Relax Ride is not liable for any delays, cancellations, or inconveniences caused by third-party service providers, weather conditions, or unforeseen circumstances.'),

            _buildSection('9. Changes to Terms',
                'We reserve the right to modify these terms at any time. Continued use of the service constitutes acceptance of the modified terms.'),

            _buildSection('10. Contact Information',
                'For any questions about these Terms & Conditions, please contact us at:\nEmail: support@relaxride.com\nPhone: +8801612939330'),

            const SizedBox(height: 30),
            const Text(
              'By using Relax Ride, you acknowledge that you have read, understood, and agree to be bound by these Terms and Conditions.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.teal.shade800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
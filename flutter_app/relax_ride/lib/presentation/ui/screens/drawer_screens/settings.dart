import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  bool _locationServicesEnabled = true;
  bool _autoLoginEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal.shade600,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account Settings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade800,
              ),
            ),
            const SizedBox(height: 20),

            _buildSettingItem(
              icon: Icons.notifications,
              title: 'Push Notifications',
              subtitle: 'Receive updates about your bookings',
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),

            _buildSettingItem(
              icon: Icons.location_on,
              title: 'Location Services',
              subtitle: 'Allow access to your location',
              value: _locationServicesEnabled,
              onChanged: (value) {
                setState(() {
                  _locationServicesEnabled = value;
                });
              },
            ),

            _buildSettingItem(
              icon: Icons.security,
              title: 'Auto Login',
              subtitle: 'Stay logged in on this device',
              value: _autoLoginEnabled,
              onChanged: (value) {
                setState(() {
                  _autoLoginEnabled = value;
                });
              },
            ),

            const SizedBox(height: 30),
            Text(
              'Preferences',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade800,
              ),
            ),
            const SizedBox(height: 20),

            _buildPreferenceItem(
              icon: Icons.language,
              title: 'Language',
              subtitle: 'English',
              onTap: () {
                // Handle language change
              },
            ),

            _buildPreferenceItem(
              icon: Icons.currency_exchange,
              title: 'Currency',
              subtitle: 'BDT (৳)',
              onTap: () {
                // Handle currency change
              },
            ),

            _buildPreferenceItem(
              icon: Icons.text_snippet,
              title: 'Terms & Conditions',
              subtitle: 'View our terms of service',
              onTap: () {
                // Navigate to terms
              },
            ),

            _buildPreferenceItem(
              icon: Icons.privacy_tip,
              title: 'Privacy Policy',
              subtitle: 'How we handle your data',
              onTap: () {
                // Navigate to privacy policy
              },
            ),

            const SizedBox(height: 30),
            Text(
              'Support',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade800,
              ),
            ),
            const SizedBox(height: 20),

            _buildSupportItem(
              icon: Icons.help,
              title: 'Help Center',
              onTap: () {
                // Navigate to help center
              },
            ),

            _buildSupportItem(
              icon: Icons.contact_support,
              title: 'Contact Support',
              onTap: () {
                // Navigate to contact
              },
            ),

            _buildSupportItem(
              icon: Icons.star,
              title: 'Rate Our App',
              onTap: () {
                // Navigate to app store
              },
            ),

            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle save settings
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade600,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 3,
                ),
                child: const Text(
                  'Save Settings',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal.shade600),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.teal.shade800,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.teal.shade600),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Colors.teal.shade600,
      ),
    );
  }

  Widget _buildPreferenceItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required Function() onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal.shade600),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.teal.shade800,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.teal.shade600),
      ),
      trailing: Icon(Icons.chevron_right, color: Colors.teal.shade600),
      onTap: onTap,
    );
  }

  Widget _buildSupportItem({
    required IconData icon,
    required String title,
    required Function() onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal.shade600),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.teal.shade800,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(Icons.chevron_right, color: Colors.teal.shade600),
      onTap: onTap,
    );
  }
}
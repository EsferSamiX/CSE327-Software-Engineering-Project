import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:relax_ride/constants.dart';
import 'package:relax_ride/getx_controller/main_controller.dart';
import 'package:relax_ride/presentation/ui/screens/main_bottom_nav.dart';
import '../widgets/app_logo.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    Future<void> register() async {
      if (!_formKey.currentState!.validate()) return;

      try {
        final response = await http.post(
          Uri.parse('$uri/signup'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'username': mainController.phoneController.text +
                mainController.fnameController.text +
                mainController.lnameController.text,
            'phone': "+880${mainController.phoneController.text}",
            'password': mainController.passwordController.text,
            'email': mainController.emailController.text.toLowerCase(),
            'fname': mainController.fnameController.text,
            'lname': mainController.lnameController.text,
            'city': mainController.cityController.text,
          }),
        );

        if (response.statusCode == 201) {
          mainController.setData('data', response.body);
          Get.offAll(() => const MainBottomNav());
          mainController.inputClear();
        } else if (response.statusCode == 404) {
          Get.snackbar('Error', 'User/Phone number doesn\'t exists');
          debugPrint('Phone number already exists');
        } else if (response.statusCode == 409) {
          // User already registered
          Get.snackbar('Error', 'User/Phone number already exists');
          debugPrint('Phone number already exists');
        } else {
          // Handle other status codes if needed
          Get.snackbar('Error', 'Error occurred during registration');
          debugPrint('Unexpected status code: ${response.statusCode}');
        }
      } catch (e) {
        Get.snackbar('Error', 'Error occurred during registration');
        // Handle error
        debugPrint('Error occurred during registration: $e');
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 60),
                const AppLogo(height: 90),
                const SizedBox(height: 20),
                Text(
                  "Complete Profile",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Get started with us with your details",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 40),

                // First Name Field
                TextFormField(
                  controller: mainController.fnameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(Icons.person, color: Colors.teal),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    if (RegExp(r'[0-9!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
                      return 'First name should contain only letters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Last Name Field
                TextFormField(
                  controller: mainController.lnameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(Icons.person_outline, color: Colors.teal),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    if (RegExp(r'[0-9!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
                      return 'Last name should contain only letters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Email Field
                TextFormField(
                  controller: mainController.emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(Icons.email, color: Colors.teal),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'[A-Z\s]')),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Email must contain @ symbol';
                    }
                    if (RegExp(r'[A-Z\s]').hasMatch(value)) {
                      return 'Email should not contain uppercase letters or spaces';
                    }

                    // Check for valid domain extensions
                    final emailParts = value.split('@');
                    if (emailParts.length != 2) {
                      return 'Invalid email format';
                    }

                    final domain = emailParts[1];

                    // List of allowed email domains
                    final allowedDomains = [
                      'gmail.com', 'yahoo.com', 'hotmail.com', 'outlook.com',
                      'icloud.com', 'protonmail.com', 'aol.com', 'zoho.com',
                      'mail.com', 'yandex.com', 'gmx.com'
                    ];

                    // List of allowed domain extensions
                    final allowedExtensions = [
                      '.com', '.edu', '.org', '.net', '.bd', '.com.bd', '.edu.bd',
                      '.org.bd', '.net.bd', '.ac.bd', '.gov.bd', '.mil.bd'
                    ];

                    // Check if it's a popular email service
                    bool isPopularDomain = allowedDomains.contains(domain);

                    // Check if it has an allowed extension
                    bool hasAllowedExtension = allowedExtensions.any((extension) => domain.endsWith(extension));

                    if (!isPopularDomain && !hasAllowedExtension) {
                      return 'Please use a valid email domain (Gmail, Yahoo, Hotmail, etc.) or institution email';
                    }

                    // Basic email format validation
                    if (!RegExp(r'^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // City Field
                TextFormField(
                  controller: mainController.cityController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'City',
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(Icons.location_city, color: Colors.teal),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your city';
                    }
                    if (RegExp(r'[0-9!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
                      return 'City should contain only letters and spaces';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Complete Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal.shade600,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 3,
                    ),
                    onPressed: register,
                    child: const Text(
                      "Complete",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
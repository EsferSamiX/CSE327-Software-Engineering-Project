import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:relax_ride/getx_controller/main_controller.dart';
import 'package:relax_ride/presentation/ui/screens/complete_profile_screen.dart';

import '../widgets/app_logo.dart';
import 'main_bottom_nav.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final MainController mainController = Get.find();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
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
                  "Create Account",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Register to start your journey",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 40),

                // Phone Field
                TextFormField(
                  controller: mainController.phoneController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: '+8801',
                    labelText: 'Phone',
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(Icons.phone, color: Colors.teal),
                    counterText: '${mainController.phoneController.text.length}/9',
                  ),
                  maxLength: 9,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(9),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    } else if (value.length != 9) {
                      return 'Phone number must be 9 digits';
                    } else if (!RegExp(r'^[3-9]\d{8}$').hasMatch(value)) {
                      return 'Please enter a valid phone number. The digit after +8801 must be 3-9';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {}); // Update the counter
                  },
                ),
                const SizedBox(height: 16),

                // Password Field
                TextFormField(
                  controller: mainController.passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(Icons.lock, color: Colors.teal),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.teal,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 8 || value.length > 16) {
                      return 'Password must be 8-16 characters long';
                    } else if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
                      return 'Password must contain at least one uppercase letter';
                    } else if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
                      return 'Password must contain at least one lowercase letter';
                    } else if (!RegExp(r'(?=.*\d)').hasMatch(value)) {
                      return 'Password must contain at least one digit';
                    } else if (!RegExp(r'(?=.*[@$!#%*?&])').hasMatch(value)) {
                      return 'Password must contain at least one special character (@\$!%*?&)';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                // Register Button
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Get.to(() => const CompleteProfileScreen());
                      }
                    },
                    child: const Text(
                      "Register",
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
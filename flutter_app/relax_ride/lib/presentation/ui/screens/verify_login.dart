import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:relax_ride/constants.dart';
import 'package:relax_ride/getx_controller/main_controller.dart';
import 'package:relax_ride/presentation/ui/screens/main_bottom_nav.dart';
import '../widgets/app_logo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final MainController mainController = Get.find();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _isLoading = false;

  Future<void> login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse('$uri/login'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          'username': '+8801${mainController.phoneController.text}',
          'phone': '+8801${mainController.phoneController.text}',
          'password': mainController.passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        mainController.setData('data', response.body);
        Get.offAll(() => const MainBottomNav());
        mainController.inputClear();
      } else if (response.statusCode == 404) {
        Get.snackbar(
          'Account Not Found',
          'No account exists with this phone number',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else if (response.statusCode == 401) {
        Get.snackbar(
          'Invalid Credentials',
          'Incorrect password. Please try again.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else if (response.statusCode == 409) {
        Get.snackbar(
          'Error',
          'User/Phone number already exists',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Error',
          'Error occurred during login',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Error occurred during login',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      debugPrint('Error occurred during login: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

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
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Login to continue your journey",
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
                    } else if (!RegExp(r'(?=.*[@$#!%*?&])').hasMatch(value)) {
                      return 'Password must contain at least one special character (@\$!%*?&)';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                // Login Button
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
                    onPressed: _isLoading ? null : login,
                    child: _isLoading
                        ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                        : const Text(
                      "Login",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                //    Text(
                //      "Forgot your password?",
                //     style: TextStyle(
                //       color: Colors.teal.shade700,
                //       fontWeight: FontWeight.w500,
                //     ),
                //   ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
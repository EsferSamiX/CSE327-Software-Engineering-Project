import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:relax_ride/getx_controller/main_controller.dart';

import 'package:relax_ride/presentation/ui/screens/jet_setter/platinum/platinum_page3.dart';
import 'package:relax_ride/presentation/ui/utility/app_colors.dart';

import '../../../utility/assets_path.dart';
import '../../drawer_screens/terms_n_conditions.dart';
//import '../../../../terms_n_conditions.dart'; // Corrected import path

class PlatinumForm extends StatefulWidget {
  const PlatinumForm({super.key});

  @override
  State<PlatinumForm> createState() => _PlatinumFormState();
}

class _PlatinumFormState extends State<PlatinumForm> {
  bool _agreeToTerms = false;
  MainController mainController = Get.find();
  // final TextEditingController _nidController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                Image.asset(
                  AssetsPath.platinum,
                  height: 80,
                  width: 80,
                ),
                const SizedBox(height: 24),
                Text(
                  'Platinum JetSetter',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade800,
                  ),
                ),
                const SizedBox(height: 4),
                const Text('Please provide the necessary information'),
                const SizedBox(height: 40),

                // First Name Field
                TextFormField(
                  controller: TextEditingController(
                      text: mainController.userData.data!.fname),
                  decoration: InputDecoration(
                    hintText: 'First Name',
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(Icons.person, color: Colors.teal),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),

                // Last Name Field
                TextFormField(
                  controller: TextEditingController(
                      text: mainController.userData.data!.lname),
                  decoration: InputDecoration(
                    hintText: 'Last Name',
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(Icons.person_outline, color: Colors.teal),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),

                // Mobile Field
                TextFormField(
                  controller: TextEditingController(
                      text: mainController.userData.data!.phone),
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Mobile',
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(Icons.phone, color: Colors.teal),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),

                // City Field
                TextFormField(
                  controller: TextEditingController(
                      text: mainController.userData.data!.city),
                  decoration: InputDecoration(
                    hintText: 'City',
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(Icons.location_city, color: Colors.teal),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),

                // NID Field (Commented out)
                /*
                TextFormField(
                  controller: _nidController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'NID Card Number',
                  ),
                  textInputAction: TextInputAction.next,
                  // Filter input to allow only digits
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10), // Limit to 10 digits
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter NID card number';
                    }
                    if (value.length != 10) {
                      return 'NID must be exactly 10 digits';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                */

                // Terms and Conditions
                Row(
                  children: [
                    Checkbox(
                      value: _agreeToTerms,
                      onChanged: (value) {
                        setState(() {
                          _agreeToTerms = value!;
                        });
                      },
                      activeColor: Colors.teal.shade600,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to Terms and Conditions page
                          Get.to(() => const TermsNConditions());
                        },
                        child: RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'I agree to the ',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: 'terms and conditions',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.teal.shade700,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Proceed to Payment Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _agreeToTerms ? Colors.teal.shade600 : Colors.grey,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 3,
                    ),
                    onPressed: () {
                      if (!_agreeToTerms) {
                        return;
                      }
                      if (_formKey.currentState!.validate()) {
                        Get.to(() => const PlatinumPayment());
                      }
                    },
                    child: const Text(
                      "Proceed to Payment",
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
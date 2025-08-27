import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:relax_ride/constants.dart';
import 'package:relax_ride/getx_controller/main_controller.dart';
import 'package:relax_ride/presentation/ui/screens/jet_setter/gold/gold_page3.dart';
import 'add_money2.dart';

MainController mainController = Get.find();

class AddMoney extends StatefulWidget {
  const AddMoney({super.key});

  @override
  State<AddMoney> createState() => _AddMoneyState();
}

class _AddMoneyState extends State<AddMoney> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isAddingMoney = false;

  @override
  void initState() {
    super.initState();
    _controller.text = '';
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void fetchPayment() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isAddingMoney = true;
    });

    try {
      final amount = double.tryParse(_controller.text) ?? 0;

      if (amount > 20000) {
        Get.snackbar('Error', 'Cannot add more than 20,000 Taka at once');
        return;
      }

      if (amount <= 0) {
        Get.snackbar('Error', 'Please enter a valid amount');
        return;
      }

      final response = await http.post(
        Uri.parse('$uri/addMoney'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'userId': mainController.userData.data!.id.toString(),
          'amount': _controller.text,
        }),
      );

      if (response.statusCode == 200) {
        mainController.setData('data', response.body);
        Get.to(() => const AddMoneySuccess());
      } else if (response.statusCode == 409) {
        Get.snackbar('Error', 'Payment failed!');
        debugPrint('Phone number already exists');
      } else {
        Get.snackbar('Error', 'Error occurred during payment!');
        debugPrint('Unexpected status code: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Error occurred during processing payment!');
      debugPrint('Error occurred during registration: $e');
    } finally {
      setState(() {
        _isAddingMoney = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
                child: Row(
                  children: [
                    Text(
                      'Add Money',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal.shade800,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.teal.shade600,
                thickness: 1,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Select Payment Method',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const RadioWidget(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  controller: _controller,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  style: const TextStyle(fontSize: 24.0),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                    LengthLimitingTextInputFormatter(7),
                  ],
                  decoration: InputDecoration(
                    labelText: 'Amount (Taka)',
                    labelStyle: TextStyle(color: Colors.teal.shade700),
                    hintText: 'Enter amount up to 20,000',
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 16.0),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    suffixText: '৳',
                    suffixStyle: TextStyle(
                      color: Colors.teal.shade800,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an amount';
                    }
                    final amount = double.tryParse(value);
                    if (amount == null) {
                      return 'Please enter a valid number';
                    }
                    if (amount <= 0) {
                      return 'Amount must be greater than 0';
                    }
                    if (amount > 20000) {
                      return 'Maximum amount is 20,000 Taka';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      final amount = double.tryParse(value) ?? 0;
                      if (amount > 20000) {
                        _formKey.currentState?.validate();
                      }
                    }
                  },
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Maximum amount: 20,000 Taka',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _isAddingMoney ? null : fetchPayment,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isAddingMoney ? Colors.grey : Colors.teal.shade600,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 3,
                    ),
                    child: _isAddingMoney
                        ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                        : const Text(
                      'Add money',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentMethod {
  final String name;
  final String imagePath;

  PaymentMethod(this.name, this.imagePath);
}

class RadioWidget extends StatefulWidget {
  const RadioWidget({super.key});

  @override
  RadioWidgetState createState() => RadioWidgetState();
}

class RadioWidgetState extends State<RadioWidget> {
  PaymentMethod? _selectedPaymentMethod;

  final List<PaymentMethod> paymentMethods = [
    PaymentMethod('Bkash', 'assets/images/bkash.png'),
    PaymentMethod('Nagad', 'assets/images/nagad.png'),
    PaymentMethod('Nexuspay', 'assets/images/nexus.png'),
    PaymentMethod('Eastern Bank', 'assets/images/eastern.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _selectedPaymentMethod != null
            ? Column(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(_selectedPaymentMethod!.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              _selectedPaymentMethod!.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade700,
              ),
            ),
          ],
        )
            : const SizedBox(),
        const SizedBox(height: 20),
        Theme(
          data: Theme.of(context).copyWith(
            radioTheme: RadioThemeData(
              fillColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return Colors.teal.shade600;
                  }
                  return Colors.grey;
                },
              ),
            ),
          ),
          child: Column(
            children: paymentMethods
                .map(
                  (method) => RadioListTile<PaymentMethod>(
                title: Container(
                  height: 65,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.teal.shade50,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        offset: const Offset(1, 1),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(method.imagePath),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        method.name,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.teal.shade800,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                value: method,
                groupValue: _selectedPaymentMethod,
                onChanged: (PaymentMethod? value) {
                  setState(() {
                    _selectedPaymentMethod = value;
                  });
                },
              ),
            )
                .toList(),
          ),
        ),
      ],
    );
  }
}
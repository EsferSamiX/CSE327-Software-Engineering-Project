import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relax_ride/presentation/ui/screens/jet_setter/platinum/platinum_page5.dart';

class GoldToPlatinumPay extends StatefulWidget {
  const GoldToPlatinumPay({super.key});

  @override
  State<GoldToPlatinumPay> createState() => _GoldToPlatinumPayState();
}

class _GoldToPlatinumPayState extends State<GoldToPlatinumPay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payment',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal.shade600,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
                initialValue: '2000',
                readOnly: true,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  labelText: 'Amount',
                  labelStyle: TextStyle(color: Colors.teal.shade700),
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 150,
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
                  Get.to(const PlatinumCongra());
                },
                child: const Text(
                  'Payment',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
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
  _RadioWidgetState createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
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
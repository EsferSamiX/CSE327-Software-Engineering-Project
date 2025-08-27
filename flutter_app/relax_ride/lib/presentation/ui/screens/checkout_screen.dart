import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relax_ride/constants.dart';
import 'package:relax_ride/getx_controller/main_controller.dart';
import 'package:relax_ride/local_notification/local_notification.dart';
import 'package:relax_ride/presentation/ui/screens/main_bottom_nav.dart';
import 'package:relax_ride/presentation/ui/screens/payment_success.dart';
import 'package:http/http.dart' as http;

RxBool radioWidgetSelectedState = false.obs;
MainController mainController = Get.find();

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String? _selectedValue = 'Abdullahpur';

  @override
  void initState() {
    radioWidgetSelectedState.value = false;
    mainController.selectedPaymentMethodLoan.value = false;
    mainController.selectedPaymentMethod.value = false;
    super.initState();
  }

  Future<void> confirmTrip(context) async {
    try {
      final response = await http.post(
        Uri.parse('$uri/tripConfirm'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'userId': mainController.userId.value,
          'tripId': mainController.tripId.value,
          'seatTakenLength': mainController.seatTakenLength.value.toString(),
          'seatTaken': mainController.seatTaken.value,
          'loanSeatAmount': mainController.selectedPaymentMethodLoan.value
              ? (mainController.seatTakenLength.value <
              mainController.userData.data!.availableLoan!
              ? mainController.seatTakenLength.value.toString()
              : mainController.userData.data!.availableLoan!.toString())
              : '0',
          'loanAmount': mainController.selectedPaymentMethodLoan.value
              ? (mainController.seatTakenLength.value <=
              mainController.userData.data!.availableLoan!.toInt()
              ? (mainController.seatTakenLength.value *
              mainController.selectedPrice.value)
              .toString()
              : ((mainController.userData.data!.availableLoan!.toInt()) *
              mainController.selectedPrice.value)
              .toString())
              : '0',
        }),
      );

      if (response.statusCode == 201) {
        mainController.setData('data', response.body);
        debugPrint('Trip fetched successfully. ${response.body}');

        Get.offAll(() => const MainBottomNav());
        Get.to(() => const PaymentSuccess());
        CustomLocalNotification().showNotification(
            'Trip Confirmed', 'Your trip has been confirmed successfully');
      } else if (response.statusCode == 409) {
        Get.snackbar('Error', 'User/Phone number already exists');
        debugPrint('Phone number already exists');
      } else {
        Get.snackbar('Error', 'Error occurred during trip');
        debugPrint('Unexpected status code: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Error occurred during trip');
      debugPrint('Error occurred during fetching trip: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
              child: Row(
                children: [
                  Text(
                    'Checkout',
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
                  'Select Boarding Point',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButton(
                      value: _selectedValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedValue = newValue;
                        });
                        debugPrint(newValue);
                      },
                      items: [
                        'Abdullahpur',
                        'Airport ',
                        'Norda',
                        'Rampura',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
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
            const RadioWidget(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Obx(() {
                return TextFormField(
                  controller: TextEditingController(
                    text: mainController.selectedPaymentMethodLoan.value
                        ? '${(mainController.seatTakenLength.value < mainController.userData.data!.availableLoan! ? 0 : (mainController.seatTakenLength.value - mainController.userData.data!.availableLoan!.toDouble()) * mainController.selectedPrice.value).toStringAsFixed(2)} BDT'
                        : '${(mainController.seatTakenLength.value * mainController.selectedPrice.value).toStringAsFixed(2)} BDT',
                  ),
                  readOnly: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    labelStyle: TextStyle(color: Colors.teal.shade700),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 16.0),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: Obx(() {
                  return ElevatedButton(
                    onPressed: () async {
                      if (mainController.selectedPaymentMethodLoan.value &&
                          mainController.seatTakenLength.value >
                              mainController.userData.data!.availableLoan!) {
                        Get.snackbar('Loan seats limit exceed ',
                            'Your avaliable loan is ${mainController.userData.data!.availableLoan} seats');
                        return;
                      }
                      await confirmTrip(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: radioWidgetSelectedState.value
                          ? Colors.teal.shade600
                          : Colors.grey,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 3,
                    ),
                    child: const Text(
                      'Pay',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class PaymentMethod {
  final String name;
  final String imagePath;
  final bool isLoanOption;

  PaymentMethod(this.name, this.imagePath, {this.isLoanOption = false});
}

class RadioWidget extends StatefulWidget {
  const RadioWidget({super.key});

  @override
  RadioWidgetState createState() => RadioWidgetState();
}

class RadioWidgetState extends State<RadioWidget> {
  PaymentMethod? _selectedPaymentMethod;

  List<PaymentMethod> get paymentMethods {
    List<PaymentMethod> methods = [
      PaymentMethod('Bkash', 'assets/images/bkash.png'),
      PaymentMethod('Nagad', 'assets/images/nagad.png'),
      PaymentMethod('Nexuspay', 'assets/images/nexus.png'),
      PaymentMethod('Eastern Bank', 'assets/images/eastern.png'),
    ];

    // Only add loan option if available loan seats > 0
    if (mainController.userData.data!.availableLoan! > 0) {
      methods.add(PaymentMethod('Take Loan', 'assets/images/addmoney.png', isLoanOption: true));
    }

    return methods;
  }

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
                        height: 60,
                        width: 60,
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
                    radioWidgetSelectedState.value = true;
                    // Use the isLoanOption property instead of checking if it's the last item
                    mainController.selectedPaymentMethodLoan.value = value?.isLoanOption ?? false;
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
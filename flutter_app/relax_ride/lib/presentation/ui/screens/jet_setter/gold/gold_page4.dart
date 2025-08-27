import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'gold_page5.dart';

class GoldPaymentSuccess extends StatefulWidget {
  const GoldPaymentSuccess({Key? key}) : super(key: key);

  @override
  State<GoldPaymentSuccess> createState() => _GoldPaymentSuccessState();
}

class _GoldPaymentSuccessState extends State<GoldPaymentSuccess> {
  @override
  void initState(){
    super.initState();
    moveToNextScreen();
  }

  void moveToNextScreen() async{
    await Future.delayed(Duration(seconds: 4));
    Get.offAll( GoldCongra());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          Center(
            child: Image.asset(
              'assets/images/success.gif',
              width: 200,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Successful',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.teal.shade800,
            ),
          ),
          const SizedBox(height: 40),
          Text(
            'Your payment was done successfully!!!',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: 200,
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
                Get.offAll(GoldCongra());
              },
              child: const Text(
                "Continue",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relax_ride/presentation/ui/screens/jet_setter/gold/gold_page2.dart';
import 'package:relax_ride/presentation/ui/utility/app_colors.dart';

class GoldPage extends StatefulWidget {
  const GoldPage({super.key});

  @override
  State<GoldPage> createState() => _GoldPageState();
}

class _GoldPageState extends State<GoldPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Gold JetSetter',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          backgroundColor: AppColors.p1.withOpacity(0.2),
          elevation: 3,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.p1,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1, 1),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Key Features',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),
                  _FeatureItem(
                    text: 'You can use 80% of your package subscription fee',
                  ),
                  SizedBox(height: 10),
                  _FeatureItem(
                    text: 'Can withdraw booking before 36 hours.',
                  ),
                  SizedBox(height: 10),
                  _FeatureItem(
                    text: 'Can avail 1 seat from loan facilities.',
                  ),
                  SizedBox(height: 10),
                  _FeatureItem(
                    text: 'You can enjoy upto 10% discounts from our partners like renowned hotels and shops',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.p1,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1, 1),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Instructions',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),
                  _FeatureItem(
                    text: 'Pay the subscription fee of 1000 TK to unlock access to Gold JetSetter benefits.',
                  ),
                  SizedBox(height: 10),
                  _FeatureItem(
                    text: 'Fill the given form',
                  ),
                  SizedBox(height: 10),
                  _FeatureItem(
                    text: 'Select a payment gateway.',
                  ),
                  SizedBox(height: 10),
                  _FeatureItem(
                    text: 'Proceed to payment',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          margin: const EdgeInsets.only(bottom: 28),
          width: 250,
          child: ElevatedButton(
            onPressed: () {
              Get.to(() => const GoldForm());
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle),
                SizedBox(
                  width: 5,
                ),
                Text('Subscribe'),
              ],
            ),
          ),
        ));
  }
}

class _FeatureItem extends StatelessWidget {
  final String text;

  const _FeatureItem({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.check_circle, size: 16, color: Colors.green),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
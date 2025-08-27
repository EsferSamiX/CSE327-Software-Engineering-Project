import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relax_ride/presentation/ui/utility/app_colors.dart';
import 'Platinum_page2.dart';

class PlatinumPage extends StatefulWidget {
  const PlatinumPage({super.key});

  @override
  State<PlatinumPage> createState() => _PlatinumPageState();
}

class _PlatinumPageState extends State<PlatinumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Platinum JetSetter',
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
                    text: 'Can withdraw booking before 12 hours.',
                  ),
                  SizedBox(height: 10),
                  _FeatureItem(
                    text: 'Can avail 3 seat from loan facilities.',
                  ),
                  SizedBox(height: 10),
                  _FeatureItem(
                    text: 'You can enjoy upto 30% discounts from our partners like renowned hotels and shops',
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
                    text: 'Pay the subscription fee of 3000 TK to unlock access to Platinum JetSetter benefits.',
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
        floatingActionButton: SizedBox(
          width: 250,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => const PlatinumForm());
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
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relax_ride/presentation/ui/screens/jet_setter/gold/gold_page1.dart';
import 'package:relax_ride/presentation/ui/screens/jet_setter/platinum/platinum_page1.dart';
import 'package:relax_ride/presentation/ui/utility/assets_path.dart';

class jetSetter extends StatefulWidget {
  const jetSetter({super.key});

  @override
  State<jetSetter> createState() => _jetSetterState();
}

class _jetSetterState extends State<jetSetter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
              child: Row(
                children: [
                  Text(
                    'JetSetter',
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
            Text(
              'We have 2 JetSetter Schemes',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade800,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'You can explore those.',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade800,
              ),
            ),
            const SizedBox(height: 100),
            GestureDetector(
              onTap: () {
                Get.to(() => const GoldPage());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
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
                child: SizedBox(
                  width: 250,
                  height: 120,
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      Image.asset(
                        AssetsPath.gold,
                        height: 50,
                        width: 50,
                      ),
                      Text(
                        '  Gold JetSetter',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.teal.shade800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                Get.to(() => const PlatinumPage());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
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
                child: SizedBox(
                  width: 250,
                  height: 120,
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      Image.asset(
                        AssetsPath.platinum,
                        height: 50,
                        width: 50,
                      ),
                      Text(
                        '  Platinum JetSetter',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.teal.shade800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
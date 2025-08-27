import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relax_ride/presentation/ui/screens/main_bottom_nav.dart';
import 'package:relax_ride/presentation/ui/utility/assets_path.dart';

class PlatinumCongra extends StatefulWidget {
  const PlatinumCongra({Key? key}) : super(key: key);

  @override
  State<PlatinumCongra> createState() => _PlatinumCongraState();
}

class _PlatinumCongraState extends State<PlatinumCongra> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsPath.platinum,
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 15),
            Image.asset(
              AssetsPath.con,
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 16),
            Text(
              'Congratulations!\nYou are now a Platinum Jetsetter',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade800,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 380,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(const MainBottomNav());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade600,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 3,
                ),
                child: const Text(
                  'Go back to home screen',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
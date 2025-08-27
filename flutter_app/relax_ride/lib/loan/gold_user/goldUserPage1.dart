import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relax_ride/getx_controller/main_controller.dart';
import 'package:relax_ride/presentation/ui/screens/checkout_screen.dart';
import 'package:relax_ride/presentation/ui/utility/assets_path.dart';
import 'goldUserPage2.dart';

class GoldUserP1 extends StatefulWidget {
  const GoldUserP1({super.key});

  @override
  State<GoldUserP1> createState() => _GoldUserP1State();
}

class _GoldUserP1State extends State<GoldUserP1> {
  MainController mainController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'My Loan',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AssetsPath.gold,
                  height: 60,
                ),
                const SizedBox(width: 10),
                Text(
                  'Gold Jetsetter',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade800,
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.teal.shade600,
              thickness: 1,
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const SizedBox(width: 15),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.teal.shade50,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: const Offset(1, 1),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: SizedBox(
                    width: 370,
                    height: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const SizedBox(width: 20),
                            Text(
                              'Remaining Loan Seats :',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.teal.shade800,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.teal.shade600,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    offset: const Offset(1, 1),
                                    blurRadius: 8,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      mainController
                                          .userData.data!.availableLoan
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const SizedBox(width: 15),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.teal.shade50,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: const Offset(1, 1),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: SizedBox(
                    width: 370,
                    height: 250,
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 30.0, top: 2.0),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('You are a gold Jetsetter now, so you can avail'),
                                SizedBox(height: 5),
                                Text('1 loan seat. But You can get at most 3 Loan'),
                                SizedBox(height: 5),
                                Text('seats by upgrading to platinum Jetsetter.'),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 80),
                        /* Container(
                          child: SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(const GoldToPlatinumPay());
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal.shade600,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                elevation: 3,
                              ),
                              child: const Text(
                                'Upgrade now',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ) */
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            /* Container(
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: const Offset(1, 1),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: SizedBox(
                width: 380,
                height: 250,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      'Loan History',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal.shade800,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 30, top: 3),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 3),
                          child: Text(
                            'No loan history available',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.teal.shade700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ), */
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
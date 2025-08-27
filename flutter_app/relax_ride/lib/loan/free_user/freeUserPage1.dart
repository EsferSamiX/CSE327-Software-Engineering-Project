import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relax_ride/presentation/ui/screens/jet_setter.dart';
import 'package:relax_ride/presentation/ui/utility/assets_path.dart';

class FreeUserP1 extends StatefulWidget {
  const FreeUserP1({super.key});

  @override
  State<FreeUserP1> createState() => _FreeUserP1State();
}

class _FreeUserP1State extends State<FreeUserP1> {
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
                  AssetsPath.free,
                  height: 40,
                ),
                const SizedBox(width: 10),
                Text(
                  'Free User',
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
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: SizedBox(
                    width: 360,
                    height: 250,
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0, top: 2.0),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'You are free user of this app for availing',
                                  style: TextStyle(
                                    color: Colors.teal.shade800,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'seat as loan you have to subscribe any of our',
                                  style: TextStyle(
                                    color: Colors.teal.shade800,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'jetsetter schemes',
                                  style: TextStyle(
                                    color: Colors.teal.shade800,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 80),
                        Container(
                          child: SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(const jetSetter());
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
                        ),
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
                        Padding(
                          padding: const EdgeInsets.only(left: 30, top: 3),
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
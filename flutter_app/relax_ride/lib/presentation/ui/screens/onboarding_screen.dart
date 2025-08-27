import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relax_ride/presentation/ui/screens/welcome.dart';
import 'package:relax_ride/presentation/ui/utility/app_colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: data.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => OnboardContent(
                    image: data[index].image,
                    title: data[index].title,
                    description: data[index].description,
                  ),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    data.length,
                        (index) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Dotindicator(
                        isActive: index == _pageIndex,
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_pageIndex == data.length - 1) {
                          Get.to(const WelcomePage());
                        } else {
                          _pageController.nextPage(
                            curve: Curves.ease,
                            duration: const Duration(milliseconds: 300),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal.shade600,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 3,
                      ),
                      child: Icon(
                        _pageIndex == data.length - 1
                            ? Icons.check
                            : Icons.arrow_forward_outlined,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Dotindicator extends StatelessWidget {
  const Dotindicator({
    super.key,
    this.isActive = false,
  });
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
        color: isActive ? Colors.teal.shade600 : Colors.grey.shade400,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

class Onboard {
  final String image, title, description;
  Onboard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<Onboard> data = [
  Onboard(
    image: 'assets/images/notification.png',
    title: 'A Proactive push notification feature',
    description: 'Proactive push notifications ensure timely trip alerts, with'
        ' continual reminders until boarding confirmation.',
  ),
  Onboard(
    image: 'assets/images/card.jpg',
    title: 'Secure payment system',
    description: 'Secure payment processing with encrypted data, integrating '
        'popular gateways and digital wallets for convenience.',
  ),
  Onboard(
    image: 'assets/images/wallet.jpg',
    title: 'Digital Wallet',
    description:
    'Convenient in-app digital wallet for frequent travelers, bypassing'
        ' payment gateways for seamless transactions.',
  ),
  Onboard(
    image: 'assets/images/loan.png',
    title: 'Loan facilities',
    description: 'Loan feature for frequent travelers'
        ' replenishes digital wallet when funds are depleted',
  ),
  Onboard(
    image: 'assets/images/liveSupport.png',
    title: '24/7 Customer support',
    description: '24/7 live support for any ticketing or'
        ' in-app feature issues, providing immediate assistance',
  ),
];

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });
  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () {
                Get.to(const WelcomePage());
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  color: Colors.teal.shade700,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
        Image.asset(
          image,
          height: 200,
          width: 500,
        ),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.teal.shade800,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
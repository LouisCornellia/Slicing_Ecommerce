import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slicing_application/controllers/auth_controller.dart';
import 'package:slicing_application/page/signin_page.dart';
import 'package:slicing_application/utils/font.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingItem> _items = [
    OnboardingItem(
      image: 'assets/images/intro.png',
      title: 'Discover Latest Trends',
      description:
          'Explore the newest fashion Trends and find your unique style',
    ),
    OnboardingItem(
      image: 'assets/images/intro1.png',
      title: 'Shop Premium Items',
      description: "Only serves the best quality products for good price",
    ),
    OnboardingItem(
      image: 'assets/images/intro2.png',
      title: 'Easy Shopping',
      description: "Simple and secure shopping experience at your fingertips",
    ),
  ];

  //handle get started button pressed
  void _handleGetStarted() {
    final AuthController authController = Get.find<AuthController>();
    authController.setFirstTimeDone();
    Get.off(() => SigninPage());
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _items.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    _items[index].image,
                    height: MediaQuery.of(context).size.height * 0.35,
                  ),
                  Text(
                    _items[index].title,
                    style: Fonts.withColor(
                      Fonts.h1,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                  SizedBox(height: 10),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      _items[index].description,
                      textAlign: TextAlign.center,
                      style: Fonts.withColor(
                        Fonts.bodyMedium,
                        isDark ? Colors.grey.shade400 : Colors.grey.shade600,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            bottom: 115,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _items.length,
                (index) => AnimatedContainer(
                  duration: Duration(microseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: _currentPage == index ? 20 : 8,
                  decoration: BoxDecoration(
                    color:
                        _currentPage == index
                            ? Theme.of(context).primaryColor
                            : (isDark ? Colors.white : Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 35,
            left: 15,
            right: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => _handleGetStarted(),
                  child: Text(
                    "Skip",
                    style: Fonts.withColor(
                      Fonts.buttonMedium,
                      isDark ? Colors.grey.shade400 : Colors.grey.shade600,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage < _items.length - 1) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.bounceInOut,
                      );
                    } else {
                      _handleGetStarted();
                    }
                  },
                  //Next button
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 13, horizontal: 25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                  child: Text(
                    _currentPage < _items.length - 1 ? 'Next' : 'Get Started',
                    style: Fonts.withColor(Fonts.buttonMedium, Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingItem {
  final String image;
  final String title;
  final String description;

  OnboardingItem({
    required this.image,
    required this.title,
    required this.description,
  });
}

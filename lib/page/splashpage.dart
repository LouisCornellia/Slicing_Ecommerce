import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
// import 'package:get/route_manager.dart';
import 'package:slicing_application/controllers/auth_controller.dart';
import 'package:slicing_application/page/homepage.dart';
import 'package:slicing_application/page/onboarding_page.dart';
import 'package:slicing_application/page/signin_page.dart';

class Splashpage extends StatelessWidget {
  Splashpage({super.key});

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    //navigate based on auth state after 3 sec
    Future.delayed(Duration(milliseconds: 3000), () {
      if (authController.isFirstTime) {
        Get.off(
          () => OnboardingPage(),
        ); //untuk ganti halaman, menghapus halaman sebelumnya dari stack
      } else if (authController.isLoggedIn) {
        Get.off(() => Homepage());
      } else {
        Get.off(() => SigninPage());
      }
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).primaryColor,
              // ignore: deprecated_member_use
              Theme.of(context).primaryColor.withOpacity(0.7),
              // ignore: deprecated_member_use
              Theme.of(context).scaffoldBackgroundColor.withOpacity(0.3),
            ],
          ),
        ),
        child: Stack(
          children: [
            //Background pattern
            Positioned.fill(
              child: Opacity(
                opacity: 0.03,
                child: GridPattern(color: Colors.white),
              ),
            ),

            //main content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //animated logo container
                  // TweenAnimationBuilder<double>(
                  //   tween: Tween(begin: 0.0, end: 1.0),
                  //   duration: Duration(milliseconds: 1200),
                  //   builder: (context, value, child) {
                  //     return Transform.scale(
                  //       scale: value,
                  //       child: Container(
                  //         padding: EdgeInsets.all(24),
                  //         decoration: BoxDecoration(
                  //           color: Colors.white,
                  //           shape: BoxShape.circle,
                  //           boxShadow: [
                  //             BoxShadow(
                  //               color: Colors.grey.withOpacity(0.1),
                  //               blurRadius: 20,
                  //               spreadRadius: 2,
                  //               offset: Offset(0, 4),
                  //             ),
                  //           ],
                  //         ),
                  //         child: Icon(
                  //           Icons.shopping_bag_outlined,
                  //           size: 40,
                  //           color: Theme.of(context).primaryColor,
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // ),
                  // SizedBox(height: 32),

                  //animated Text
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0, end: 1.0),
                    duration: Duration(milliseconds: 1200),
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: Transform.translate(
                          offset: Offset(0, 20 * (1 - value)),
                          child: child,
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Text(
                          "atmega",
                          style: GoogleFonts.pacifico(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -2,
                            color: Color(0xffEBE8DB),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //bottom tagline
            Positioned(
              bottom: 50,
              left: 120,
              right: 0,
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: Duration(milliseconds: 1200),
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0, 20 * (1 - value)),
                      child: child,
                    ),
                  );
                },
                child: Text(
                  "Style Meets Simple",
                  style: TextStyle(
                    // ignore: deprecated_member_use
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 2,
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

class GridPattern extends StatelessWidget {
  final Color color;
  // ignore: use_super_parameters
  const GridPattern({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: GridPainter(color: color));
  }
}

class GridPainter extends CustomPainter {
  final Color color;

  GridPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..strokeWidth = 0.5;

    final spacing = 20.0;

    for (var i = 0.0; i < size.width; i += spacing) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (var i = 0.0; i < size.height; i += spacing) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDeletate) => false;
}

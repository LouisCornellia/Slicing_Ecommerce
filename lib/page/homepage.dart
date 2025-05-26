import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Column(
              children: [
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Breath in",
                      style: GoogleFonts.roboto(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 500),
                Image.asset("assets/greeny.png", width: 1000),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

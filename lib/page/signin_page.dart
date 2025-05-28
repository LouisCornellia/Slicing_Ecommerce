import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slicing_application/utils/font.dart';
import 'package:slicing_application/utils/textfield_form.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Text(
                "Welcome Back!",
                style: Fonts.withColor(
                  Fonts.h1,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              SizedBox(height: 6),
              Text(
                "Sign in to continue shopping",
                style: Fonts.withColor(
                  Fonts.bodyMedium,
                  isDark ? Colors.grey.shade300 : Colors.grey.shade600,
                ),
              ),
              SizedBox(height: 35),

              //Email textfield
              TextfieldForm(
                label: "Email",
                prefixIcon: Icons.email_outlined,
                isPassword: false,
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Your Email';
                  }
                  if (!GetUtils.isEmail(value)) {
                    return 'Please Enter Valid Email Address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),

              //password textfield
              TextfieldForm(
                label: "Password",
                prefixIcon: Icons.email_outlined,
                isPassword: true,
                keyboardType: TextInputType.visiblePassword,
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Your Password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 5),

              //forgot password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password',
                    style: Fonts.withColor(
                      Fonts.buttonMedium,
                      Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    "Sign In",
                    style: Fonts.withColor(Fonts.buttonMedium, Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

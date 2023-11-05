import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formula_1/features/utils/views/registration_screen.dart';
import '../../../core/utils/values/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;
    //scheduling a delayed navigation action that occurs 1 second after the SplashScreen is displayed
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => RegistrationScreen(),
        ),
      );
    });
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(gradient: customLinearGradient),
          child: Center(
            child: SvgPicture.asset(
              'assets/f1_logo_1.svg',
              width: size.width * 0.8,
              height: size.width * 0.2,
            ),
          ),
        ),
      ),
    );
  }
}

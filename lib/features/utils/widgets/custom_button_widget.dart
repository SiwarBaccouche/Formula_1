import 'package:flutter/material.dart';
import 'package:formula_1/core/utils/values/styles.dart';
import '../../../core/utils/values/colors.dart';

class CustomButton extends StatelessWidget {
  final String buttonTitle;
  final IconData icon;
  final VoidCallback onPressed;

  CustomButton({
    required this.buttonTitle,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;

    return Container(
      width: 209,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          padding: EdgeInsets.zero,
          elevation: 5,
          shadowColor: lighterBlackColor,
        ),
        onPressed: onPressed,
        child: Ink(
          decoration: BoxDecoration(
            gradient: customLinearGradient,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  buttonTitle,
                  style: whiteTitleStyle,
                ),
                SizedBox(width: 20),
                Icon(
                  icon,
                  color: whiteColor,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/utils/values/colors.dart';
import '../../../core/utils/values/styles.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool isObscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  CustomTextField({
    required this.hintText,
    this.isObscureText = false,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;
    final OutlineInputBorder customBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: lightGreyColor, width: 1),
    );
    final inputFormatter =
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'));
    final lengthLimit = LengthLimitingTextInputFormatter(25);
    return Container(
        width: size.width * 0.8,
        child: TextFormField(
          validator: validator,
          controller: controller,
          inputFormatters: [inputFormatter, lengthLimit],
          style: simpleTextStyle,
          cursorColor: greenColor,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintTextStyle,
            enabledBorder: customBorder,
            focusedBorder: customBorder.copyWith(
              borderSide:const BorderSide(
                color: greenColor,
              ),
            ),
          ),
          obscureText: isObscureText,
        ));
  }
}

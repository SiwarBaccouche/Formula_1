import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formula_1/core/utils/values/colors.dart';
import '../../../core/utils/values/styles.dart';
import '../widgets/custom_button_widget.dart';
import '../widgets/custom_textField_widget.dart';
import 'home_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // customization of the status bar's appearance
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: redColor,
    ));
  }

  @override
  void dispose() {
    // Reset the status bar and system navigation bar color when disposing the screen
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.dispose();
  }

  // end of the customization of the status bar's appearance

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(top: size.height * 0.1),
          child: SingleChildScrollView(
            //avoiding the content overflow when the keyboard is active
            child: Form(
              // Wrap your fields in a Form widget
              key: _formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/F1_Logo.svg',
                      width: 153,
                      height: 38,
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Text("Let’s Get Familiar", style: titleTextStyle),
                    Text(
                      "Introduce yourself",
                      style: subtitleTextStyle,
                    ),
                    SizedBox(height: size.height * 0.15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("First Name", style: simpleTextStyle),
                        CustomTextField(
                          controller: firstNameController,
                          hintText: "Type in your first name",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This field can't be empty";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: size.height * 0.02),
                        Text(
                          "Last Name",
                          style: simpleTextStyle,
                        ),
                        CustomTextField(
                          hintText: "Type in your last name",
                          controller: lastNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This field can't be empty";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: size.height * 0.1),
                      ],
                    ),
                    CustomButton(
                      buttonTitle: "NEXT",
                      icon: Icons.arrow_forward_ios_outlined,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                              ),
                            ),
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

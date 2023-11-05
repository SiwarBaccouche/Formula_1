import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formula_1/features/utils/models/pilotsList.dart';
import '../../../core/utils/values/colors.dart';
import '../../../core/utils/values/styles.dart';
import '../widgets/pilots_list_widget.dart';

class HomeScreen extends StatefulWidget {
  final String firstName;
  final String lastName;

  const HomeScreen({Key? key, required this.firstName, required this.lastName})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //customization of the status bar's appearance
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: redColor,
    ));
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.dispose();
  }

//end of  customization of the status bar's appearance
//handling exiting the home page
  Future<bool> _onBackPressed() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirm Exit"),
        content: const Text("Do you really want to leave?"),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text("No"),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text("Yes"),
          ),
        ],
      ),
    )) ?? false;
  }


  @override
  Widget build(BuildContext context) {

    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: redColor,
          body: Stack(
            children: [
              Positioned(
                top: 30,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/avatar.png'),
                      backgroundColor: whiteColor.withOpacity(0.7),
                    ),
                    SizedBox(width: size.width * 0.1),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good ${greetings()},",
                          style: whiteTitleStyle,
                        ),
                        Text("${widget.firstName} ${widget.lastName}",
                            style: simpleWhiteTextStyle),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: size.height * 0.2,
                child: PilotsListWidget(pilots: pilotModels),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// function that returns a greeting based on the current time of day.
String greetings() {
  final hour = TimeOfDay.now().hour;

  if (hour <= 12) {
    return 'morning';
  } else if (hour <= 17) {
    return 'afternoon';
  }
  return 'evening';
}

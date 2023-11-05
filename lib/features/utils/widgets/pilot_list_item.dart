import 'package:flutter/material.dart';
import 'package:formula_1/core/utils/values/styles.dart';
import '../../../core/utils/values/colors.dart';
import '../models/pilotsModel.dart';

class PilotListItem extends StatefulWidget {
  final PilotModel pilot;
  final int counter;

  const PilotListItem({Key? key, required this.pilot, required this.counter})
      : super(key: key);

  @override
  State<PilotListItem> createState() => _PilotListItemState();
}

class _PilotListItemState extends State<PilotListItem> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;

    return Container(
      height: size.height * 0.15,
      width: size.width * 0.8,
      decoration: const BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: lightGreyColor,
            blurRadius: 15,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: size.width * 0.03),
              Text(
                widget.counter.toString(),
                style: redTitleStyle,
              ),
              SizedBox(width: size.width * 0.03),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(widget.pilot.imagePath),
                backgroundColor: whiteColor.withOpacity(0.7),
              ),
              SizedBox(width: size.width * 0.05),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.pilot.firstName} ${widget.pilot.lastName}',
                    style: blackBoldText,
                  ),
                  Text(
                    widget.pilot.car,
                    style: simpleTextStyle,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

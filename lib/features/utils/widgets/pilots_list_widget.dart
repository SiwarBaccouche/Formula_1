import 'package:flutter/material.dart';
import 'package:formula_1/features/utils/widgets/pilot_list_item.dart';
import '../../../core/utils/values/colors.dart';
import '../../../core/utils/values/styles.dart';
import '../models/pilotsList.dart';
import '../models/pilotsModel.dart';

class PilotsListWidget extends StatefulWidget {
  final List<PilotModel> pilots;

  const PilotsListWidget({Key? key, required this.pilots}) : super(key: key);

  @override
  State<PilotsListWidget> createState() => _PilotsListWidgetState();
}

class _PilotsListWidgetState extends State<PilotsListWidget> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;
    widget.pilots.sort((a, b) => a.ranking
        .compareTo(b.ranking)); //sorting the list by comparing the ranking
    return Container(
      height: size.height * 0.8,
      width: size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        color: whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              "Top 10 ranking 2021",
              style: redTitleStyle,
            ),
          ),
          Expanded(
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Column(
                  children: widget.pilots.asMap().entries.map((entry) {
                    final index = entry
                        .key; //I'm using the index of the items instead of their ranking
                    final pilot = entry.value;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      child: PilotListItem(pilot: pilot, counter: index + 1),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

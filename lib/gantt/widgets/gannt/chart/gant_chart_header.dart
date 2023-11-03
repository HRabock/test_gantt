import 'package:flutter/material.dart';

class GantChartHeader extends StatelessWidget {
  final double heigth;
  final String name;
  const GantChartHeader({super.key, required this.heigth, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.black, width: 1)),
              color: Colors.lime[300]),
          width: 100,
          height: heigth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name),
            ],
          ),
        ),
      ],
    );
  }
}

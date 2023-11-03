import 'package:flutter/material.dart';
import 'package:test_gantt/gantt/widgets/gannt/chart/gantt_chart.dart';

class GanttChartTime extends StatelessWidget {
  final String time;
  final bool mediumHeigth;
  const GanttChartTime(
      {super.key, required this.time, this.mediumHeigth = false});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        height: GanttChart.defaultPoolSize,
        width: 49,
        color: Colors.lightBlue[200],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(time, style: const TextStyle(fontSize: 10)),
          ],
        ),
      ),
      SizedBox(
        height: GanttChart.defaultPoolSize,
        child: Column(
          children: [
            Container(
              height: mediumHeigth ? GanttChart.defaultPoolSize / 2 : 0,
              width: 1,
              color: Colors.lightBlue[200],
            ),
            Container(
              height: mediumHeigth
                  ? GanttChart.defaultPoolSize / 2
                  : GanttChart.defaultPoolSize,
              width: 1,
              color: Colors.black38,
            ),
          ],
        ),
      ),
    ]);
  }
}

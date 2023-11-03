import 'package:flutter/material.dart';
import 'package:test_gantt/gantt/widgets/gannt/chart/gantt_chart.dart';
import 'package:test_gantt/gantt/widgets/gannt/chart/gantt_chart_time.dart';
import 'package:test_gantt/gantt/widgets/gannt/entity/gantt.dart';

class GanttChartTimeline extends StatelessWidget {
  final Gantt chart;
  const GanttChartTimeline({super.key, required this.chart});

  List<GanttChartTime> _getTimeline() {
    if (chart.lastCardDate == null) {
      return [];
    }
    List<GanttChartTime> result = [];
    var minutes = (((chart.lastCardDate!.millisecondsSinceEpoch -
                    chart.startDate.millisecondsSinceEpoch) /
                1000) /
            60) +
        10;
    for (var i = 5; i <= minutes; i += 5) {
      if (i % 60 == 0) {
        result.add(GanttChartTime(time: "${i / 60}h "));
        continue;
      }
      if (i % 10 == 0) {
        result.add(GanttChartTime(time: "${i % 60}"));
        continue;
      }
      result.add(GanttChartTime(
        time: "${i % 60}",
        mediumHeigth: true,
      ));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: GanttChart.defaultPoolSize,
      child: Row(children: [..._getTimeline()]),
    );
  }
}

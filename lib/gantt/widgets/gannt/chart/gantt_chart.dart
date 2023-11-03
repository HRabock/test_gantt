// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:test_gantt/gantt/widgets/gannt/chart/gant_chart_event_pool.dart';
import 'package:test_gantt/gantt/widgets/gannt/chart/gant_chart_header.dart';
import 'package:test_gantt/gantt/widgets/gannt/chart/gantt_chart_timeline.dart';
import 'package:test_gantt/gantt/widgets/gannt/entity/gantt.dart';

class GanttChart extends StatefulWidget {
  static double defaultPoolSize = 120.0;
  static double defaultPadding = 2.5;
  static double timeScale = 10;

  final DateTime startDate = DateTime(2023, 01, 01, 9, 40);
  final Gantt ganttChart;

  GanttChart({
    super.key,
    required this.ganttChart,
  });

  @override
  State<GanttChart> createState() => _GanttChartState();
}

class _GanttChartState extends State<GanttChart> {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              SizedBox(
                height: GanttChart.defaultPoolSize,
              ),
              ...widget.ganttChart.rows.map((e) => GantChartHeader(
                  heigth: e.baias.length * GanttChart.defaultPoolSize,
                  name: e.nome)),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GanttChartTimeline(chart: widget.ganttChart),
                    ...widget.ganttChart.rows.map((e) => GanttChartEventPool(
                          baias: e.baias,
                          chart: widget.ganttChart,
                        )),
                  ]),
            ),
          ),
        ]);
  }
}

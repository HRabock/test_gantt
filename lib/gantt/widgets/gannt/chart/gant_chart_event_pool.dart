import 'package:flutter/material.dart';
import 'package:test_gantt/gantt/widgets/gannt/chart/gant_chart_event.dart';
import 'package:test_gantt/gantt/widgets/gannt/chart/gantt_chart.dart';
import 'package:test_gantt/gantt/widgets/gannt/entity/gantt.dart';
import 'package:test_gantt/gantt/widgets/gannt/entity/gantt_baia.dart';

class Event {
  final String nome;
  final String cor;

  Event({required this.nome, required this.cor});
}

class GanttChartEventPool extends StatelessWidget {
  final List<GanttBaia> baias;
  final Gantt chart;
  const GanttChartEventPool({
    super.key,
    required this.baias,
    required this.chart,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: chart.chartwidth(),
          height: (GanttChart.defaultPoolSize * baias.length),
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.black, width: 1)),
            color: Colors.black12,
          ),
          child: Stack(
            children: [
              ...baias
                  .asMap()
                  .entries
                  .map((entry) => entry.value.cards.map((card) {
                        return GanttChartEvent(
                            card: card, chart: chart, poolIndex: entry.key);
                      }).toList())
                  .toList()
                  .reduce((value, element) {
                value.addAll(element);
                return value;
              }).toList(),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:test_gantt/extensions/date_extensions.dart';
import 'package:test_gantt/gantt/widgets/gannt/chart/gantt_chart.dart';
import 'package:test_gantt/gantt/widgets/gannt/entity/gantt.dart';
import 'package:test_gantt/gantt/widgets/gannt/entity/gantt_card.dart';

class GanttChartEvent extends StatelessWidget {
  final Gantt chart;
  final GanttCard card;
  final int poolIndex;
  const GanttChartEvent({
    super.key,
    required this.chart,
    required this.card,
    required this.poolIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: getLeftPosition(card),
        top: GanttChart.defaultPoolSize * (poolIndex) +
            GanttChart.defaultPadding,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            color: card.color,
          ),
          width: card.getMinutesBetween() * GanttChart.timeScale,
          height: 115,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Ordem :  ${card.nomeOrdem}"),
              Text("Operação : ${card.nomeOperacao}"),
              Text("Capacidade : ${card.capacidade}"),
              Text(
                "De : ${card.startTime.onlyTimeToStr()}",
                overflow: TextOverflow.ellipsis,
              ),
              Text("Até : ${card.endTime.onlyTimeToStr()}"),
              if (card.nomeRecurso != null)
                Text(
                  "Recurso : ${card.nomeRecurso}",
                )
            ],
          ),
        ));
  }

  double getLeftPosition(GanttCard c) {
    return (((chart.startDate.millisecondsSinceEpoch -
                    c.startTime.millisecondsSinceEpoch) /
                1000 /
                60) *
            GanttChart.timeScale)
        .abs();
  }
}

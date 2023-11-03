// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:test_gantt/gantt/widgets/gannt/entity/gantt.dart';
import 'package:test_gantt/gantt/widgets/gannt/entity/gantt_baia.dart';
import 'package:test_gantt/gantt/widgets/gannt/entity/gantt_card.dart';

class GanttRow {
  final String nome;
  final List<GanttBaia> baias;
  final Gantt ganttChart;

  GanttRow({
    required this.nome,
    required this.baias,
    required this.ganttChart,
  });

  void addCard(GanttCard card) {
    if (baias.isEmpty) {
      baias.add(GanttBaia(gantChart: ganttChart).addCard(card));
      return;
    }
    var conflict = false;
    for (var baia in baias) {
      conflict = false;
      if (baia.existsConflictTime(card)) {
        conflict = true;
        continue;
      } else {
        baia.addCard(card);
        return;
      }
    }
    if (conflict) {
      baias.add(GanttBaia(gantChart: ganttChart).addCard(card));
    }
  }
}

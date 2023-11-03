import 'package:test_gantt/gantt/widgets/gannt/entity/gant_row.dart';

class Gantt {
  final List<GanttRow> rows;
  final DateTime startDate;
  DateTime? lastCardDate;

  Gantt({
    required this.rows,
    required this.startDate,
  });

  GanttRow addRow(GanttRow row) {
    rows.add(row);
    rows.sort((a, b) {
      return a.nome.compareTo(b.nome);
    });
    return row;
  }

  double chartwidth() {
    if (lastCardDate == null) return 0;
    return ((((lastCardDate!.millisecondsSinceEpoch -
                        startDate.millisecondsSinceEpoch) /
                    1000) /
                60) *
            10) +
        100;
  }
}

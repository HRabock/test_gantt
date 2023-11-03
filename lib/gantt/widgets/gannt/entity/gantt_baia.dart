import 'package:test_gantt/gantt/widgets/gannt/entity/gantt.dart';
import 'package:test_gantt/gantt/widgets/gannt/entity/gantt_card.dart';

class GanttBaia {
  final List<GanttCard> cards = [];
  final Gantt gantChart;

  GanttBaia({required this.gantChart});

  bool existsConflictTime(GanttCard card) {
    if (cards.isNotEmpty) {
      List<GanttCard> conflictCards = cards
          .where((listCard) =>
              card.startTime.isBefore(listCard.endTime) &&
              card.endTime.isAfter(listCard.startTime))
          .toList();
      return conflictCards.isNotEmpty;
    }
    return false;
  }

  GanttBaia addCard(GanttCard card) {
    if (gantChart.lastCardDate == null ||
        gantChart.lastCardDate!.isBefore(card.endTime)) {
      gantChart.lastCardDate = card.endTime;
    }
    cards.add(card);
    cards.sort(
      (a, b) {
        if (a.startTime.isAtSameMomentAs(b.startTime)) {
          if (a.endTime.isAtSameMomentAs(b.endTime)) {
            return 0;
          } else if (a.endTime.isAfter(b.endTime)) {
            return 1;
          } else {
            return -1;
          }
        }
        if (a.startTime.isAfter(b.startTime)) return 1;
        return -1;
      },
    );
    return this;
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:test_gantt/gantt/widgets/gannt/chart/gantt_chart.dart';
import 'package:test_gantt/gantt/widgets/gannt/entity/gant_row.dart';
import 'package:test_gantt/gantt/widgets/gannt/entity/gantt.dart';
import 'package:test_gantt/gantt/widgets/gannt/entity/gantt_card.dart';

class GanttPage2 extends StatelessWidget {
  const GanttPage2({
    Key? key,
  }) : super(key: key);

  Gantt getGantt() {
    final gantt = Gantt(rows: [], startDate: DateTime(2023, 01, 01));
    var row = gantt
        .addRow(GanttRow(nome: "Batedeira 1", baias: [], ganttChart: gantt));
    row.addCard(GanttCard(
        startTime: DateTime(2023, 01, 01, 0, 10),
        endTime: DateTime(2023, 01, 01, 0, 20),
        nomeOperacao: 'bater massa',
        nomeOrdem: 'OP 01',
        capacidade: '1',
        color: Colors.red));
    row.addCard(GanttCard(
        startTime: DateTime(2023, 01, 01, 0, 10),
        endTime: DateTime(2023, 01, 01, 0, 20),
        nomeOperacao: 'bater massa',
        nomeOrdem: 'OP 02',
        capacidade: '1',
        color: Colors.blue));

    row = gantt
        .addRow(GanttRow(nome: "Batedeira 2", baias: [], ganttChart: gantt));

    row.addCard(GanttCard(
        startTime: DateTime(2023, 01, 01, 0, 10),
        endTime: DateTime(2023, 01, 01, 0, 20),
        nomeOperacao: 'Bater Massa',
        nomeOrdem: 'Op 03',
        capacidade: '1',
        color: Colors.yellow));

    row = gantt.addRow(GanttRow(nome: "Forno", baias: [], ganttChart: gantt));

    row.addCard(GanttCard(
        startTime: DateTime(2023, 01, 01, 0, 20),
        endTime: DateTime(2023, 01, 01, 2, 20),
        nomeOperacao: 'Assar',
        nomeOrdem: 'Op 01',
        capacidade: '1',
        color: Colors.red));

    row.addCard(GanttCard(
        startTime: DateTime(2023, 01, 01, 0, 20),
        endTime: DateTime(2023, 01, 01, 2, 20),
        nomeOperacao: 'Assar',
        nomeOrdem: 'Op 02',
        capacidade: '1',
        color: Colors.blue));

    row.addCard(GanttCard(
        startTime: DateTime(2023, 01, 01, 0, 20),
        endTime: DateTime(2023, 01, 01, 2, 20),
        nomeOperacao: 'Assar',
        nomeOrdem: 'Op 03',
        capacidade: '1',
        color: Colors.yellow));

    return gantt;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Gantt"),
        ),
        body: RxBuilder(builder: (context) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: GanttChart(
                    ganttChart: getGantt(),
                  ),
                ),
              ],
            ),
          );
        }));
  }
}

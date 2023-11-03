// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class GanttCard {
  final DateTime startTime;
  final DateTime endTime;
  final String nomeOperacao;
  final String nomeOrdem;
  final String? nomeRecurso;
  final String capacidade;
  final Color color;

  GanttCard({
    required this.startTime,
    required this.endTime,
    required this.nomeOperacao,
    required this.nomeOrdem,
    this.nomeRecurso,
    required this.capacidade,
    required this.color,
  });

  double getMinutesBetween() {
    return (((endTime.millisecondsSinceEpoch -
                startTime.millisecondsSinceEpoch) /
            1000) /
        60);
  }
}

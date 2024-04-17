import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Enum para representar as prioridades
enum Prioridade {
  alta,
  media,
  baixa,
}

class Tarefa {
  int id;
  String descricao;
  DateTime data;
  DateTime hora;
  Prioridade prioridade;
  bool concluida;

  Tarefa({
    required this.id,
    required this.descricao,
    required this.data,
    required this.hora,
    required this.prioridade,
    this.concluida = false,
  });

  String _dataFormatada(DateTime data) {
    return DateFormat('dd/MM/yyyy').format(data);
  }

  String descricaoCompleta() {
    String dataFormatada = _dataFormatada(data);
    String horaFormatada = DateFormat('HH:mm').format(hora); // Formata a hora

    return "Descrição: $descricao \nHora: $horaFormatada \nData: $dataFormatada";
  }
}

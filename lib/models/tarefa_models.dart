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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descricao': descricao,
      'data': _dataFormatada(data),
      'hora': DateFormat('HH:mm').format(hora),
      'prioridade': prioridade.toString(),
      'concluida': concluida ? 1 : 0,
    };
  }

  factory Tarefa.fromMap(Map<String, dynamic> map) {
    return Tarefa(
      id: map['id'],
      descricao: map['descricao'],
      data: DateFormat('dd/MM/yyyy').parse(map['data']),
      hora: DateFormat('HH:mm').parse(map['hora']),
      prioridade: Prioridade.values
          .firstWhere((e) => e.toString() == map['prioridade']),
      concluida: map['concluida'] == 1 ? true : false,
    );
  }
}

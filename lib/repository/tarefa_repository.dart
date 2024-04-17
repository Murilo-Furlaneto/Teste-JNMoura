import 'dart:math';

import 'package:teste_jnmoura/models/tarefa_models.dart';

class TarefaRepository {
  List<Tarefa> listaDeTarefas = [
    Tarefa(
      id: Random().nextInt(1000),
      descricao: "Completar relatório",
      data: DateTime(2024, 4, 15),
      hora: DateTime(2024, 4, 15, 10, 0),
      prioridade: Prioridade.alta,
    ),
    Tarefa(
      id: Random().nextInt(1000),
      descricao: "Ligar para cliente",
      data: DateTime(2024, 4, 16),
      hora: DateTime(2024, 4, 16, 14, 30),
      prioridade: Prioridade.media,
    ),
    Tarefa(
      id: Random().nextInt(1000),
      descricao: "Fazer compras",
      data: DateTime(2024, 4, 17),
      hora: DateTime(2024, 4, 17, 16, 0),
      prioridade: Prioridade.baixa,
    ),
  ];

  mudaStatus(Tarefa tarefa) {
    tarefa.concluida = true;

    listaDeTarefas.remove(tarefa);
    //listaDeTarefas.removeWhere((elemnt) => elemnt.descricao == tarefa.descricao);
  }

  void atualizarTarefa(Tarefa tarefa, Tarefa novaTarefa) {
    final index = listaDeTarefas.indexOf(tarefa);
    if (index != -1) {
      listaDeTarefas[index] = novaTarefa;
    }
  }

  adicionarTarefa(Tarefa tarefa) {
    listaDeTarefas.add(tarefa);
  }
}

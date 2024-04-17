import 'dart:math';
import 'package:mobx/mobx.dart';
import 'package:teste_jnmoura/models/tarefa_models.dart';

part 'tarefa_store.g.dart';

class TarefaStore = TarefaStoreBase with _$TarefaStore;

abstract class TarefaStoreBase with Store {
  @observable
  ObservableList<Tarefa> tarefas = ObservableList<Tarefa>.of([]);

  @observable
  DateTime? dataSelecionada;

  @observable
  Prioridade? prioridadeSelecionada;

  @action
  void mudarStatus(Tarefa tarefa) {
    tarefa.concluida = true;
    tarefas.remove(tarefa);
  }

  @action
  void atualizarTarefa(Tarefa tarefa) {
    final index = tarefas.indexWhere((element) => element.id == tarefa.id);
    if (index != -1) {
      tarefas[index] = tarefa;
    }
  }

  @action
  void adicionarTarefa(Tarefa tarefa) {
    tarefas.add(tarefa);
  }

  @action
  void filtrarPorData(DateTime data) {
    dataSelecionada = data;
    tarefas = ObservableList.of(tarefas.where((tarefa) =>
        tarefa.data.year == data.year &&
        tarefa.data.month == data.month &&
        tarefa.data.day == data.day));
  }

  @action
  void filtrarPorPrioridade(Prioridade prioridade) {
    prioridadeSelecionada = prioridade;
    tarefas = ObservableList.of(
        tarefas.where((tarefa) => tarefa.prioridade == prioridade));
  }
}

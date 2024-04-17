// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tarefa_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TarefaStore on TarefaStoreBase, Store {
  late final _$tarefasAtom =
      Atom(name: 'TarefaStoreBase.tarefas', context: context);

  @override
  ObservableList<Tarefa> get tarefas {
    _$tarefasAtom.reportRead();
    return super.tarefas;
  }

  @override
  set tarefas(ObservableList<Tarefa> value) {
    _$tarefasAtom.reportWrite(value, super.tarefas, () {
      super.tarefas = value;
    });
  }

  late final _$TarefaStoreBaseActionController =
      ActionController(name: 'TarefaStoreBase', context: context);

  @override
  void mudarStatus(Tarefa tarefa) {
    final _$actionInfo = _$TarefaStoreBaseActionController.startAction(
        name: 'TarefaStoreBase.mudarStatus');
    try {
      return super.mudarStatus(tarefa);
    } finally {
      _$TarefaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void atualizarTarefa(Tarefa tarefa) {
    final _$actionInfo = _$TarefaStoreBaseActionController.startAction(
        name: 'TarefaStoreBase.atualizarTarefa');
    try {
      return super.atualizarTarefa(tarefa);
    } finally {
      _$TarefaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void adicionarTarefa(Tarefa tarefa) {
    final _$actionInfo = _$TarefaStoreBaseActionController.startAction(
        name: 'TarefaStoreBase.adicionarTarefa');
    try {
      return super.adicionarTarefa(tarefa);
    } finally {
      _$TarefaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tarefas: ${tarefas}
    ''';
  }
}

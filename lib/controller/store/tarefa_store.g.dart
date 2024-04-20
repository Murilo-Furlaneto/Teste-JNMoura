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

  late final _$dataSelecionadaAtom =
      Atom(name: 'TarefaStoreBase.dataSelecionada', context: context);

  @override
  DateTime? get dataSelecionada {
    _$dataSelecionadaAtom.reportRead();
    return super.dataSelecionada;
  }

  @override
  set dataSelecionada(DateTime? value) {
    _$dataSelecionadaAtom.reportWrite(value, super.dataSelecionada, () {
      super.dataSelecionada = value;
    });
  }

  late final _$prioridadeSelecionadaAtom =
      Atom(name: 'TarefaStoreBase.prioridadeSelecionada', context: context);

  @override
  Prioridade? get prioridadeSelecionada {
    _$prioridadeSelecionadaAtom.reportRead();
    return super.prioridadeSelecionada;
  }

  @override
  set prioridadeSelecionada(Prioridade? value) {
    _$prioridadeSelecionadaAtom.reportWrite(value, super.prioridadeSelecionada,
        () {
      super.prioridadeSelecionada = value;
    });
  }

  late final _$mudarStatusAsyncAction =
      AsyncAction('TarefaStoreBase.mudarStatus', context: context);

  @override
  Future<void> mudarStatus(Tarefa tarefa) {
    return _$mudarStatusAsyncAction.run(() => super.mudarStatus(tarefa));
  }

  late final _$atualizarTarefaAsyncAction =
      AsyncAction('TarefaStoreBase.atualizarTarefa', context: context);

  @override
  Future<void> atualizarTarefa(Tarefa tarefa) {
    return _$atualizarTarefaAsyncAction
        .run(() => super.atualizarTarefa(tarefa));
  }

  late final _$adicionarTarefaAsyncAction =
      AsyncAction('TarefaStoreBase.adicionarTarefa', context: context);

  @override
  Future<void> adicionarTarefa(Tarefa tarefa) {
    return _$adicionarTarefaAsyncAction
        .run(() => super.adicionarTarefa(tarefa));
  }

  late final _$filtrarPorDataAsyncAction =
      AsyncAction('TarefaStoreBase.filtrarPorData', context: context);

  @override
  Future<void> filtrarPorData(DateTime data) {
    return _$filtrarPorDataAsyncAction.run(() => super.filtrarPorData(data));
  }

  late final _$filtrarPorPrioridadeAsyncAction =
      AsyncAction('TarefaStoreBase.filtrarPorPrioridade', context: context);

  @override
  Future<void> filtrarPorPrioridade(Prioridade prioridade) {
    return _$filtrarPorPrioridadeAsyncAction
        .run(() => super.filtrarPorPrioridade(prioridade));
  }

  late final _$carregarTarefasAsyncAction =
      AsyncAction('TarefaStoreBase.carregarTarefas', context: context);

  @override
  Future<void> carregarTarefas() {
    return _$carregarTarefasAsyncAction.run(() => super.carregarTarefas());
  }

  late final _$carregaListaAsyncAction =
      AsyncAction('TarefaStoreBase.carregaLista', context: context);

  @override
  Future<void> carregaLista() {
    return _$carregaListaAsyncAction.run(() => super.carregaLista());
  }

  @override
  String toString() {
    return '''
tarefas: ${tarefas},
dataSelecionada: ${dataSelecionada},
prioridadeSelecionada: ${prioridadeSelecionada}
    ''';
  }
}

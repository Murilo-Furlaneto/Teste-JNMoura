import 'package:mobx/mobx.dart';
import 'package:teste_jnmoura/controller/database/database_service.dart';
import 'package:teste_jnmoura/models/tarefa_models.dart';

part 'tarefa_store.g.dart';

class TarefaStore = TarefaStoreBase with _$TarefaStore;

abstract class TarefaStoreBase with Store {
  final DatabaseService _databaseService = DatabaseService();

  @observable
  ObservableList<Tarefa> tarefas = ObservableList<Tarefa>.of([]);

  @observable
  DateTime? dataSelecionada;

  @observable
  Prioridade? prioridadeSelecionada;

  @action
  Future<void> mudarStatus(Tarefa tarefa) async {
    tarefa.concluida = true;
    tarefas.remove(tarefa);
    await _databaseService.updateTarefa(tarefa);
  }

  @action
  Future<void> atualizarTarefa(Tarefa tarefa) async {
    final index = tarefas.indexWhere((element) => element.id == tarefa.id);
    if (index != -1) {
      tarefas[index] = tarefa;
      await _databaseService.updateTarefa(tarefa);
    }
  }

  @action
  Future<void> adicionarTarefa(Tarefa tarefa) async {
    tarefas.add(tarefa);
    await _databaseService.insertTarefa(tarefa);
  }

  @action
  Future<void> filtrarPorData(DateTime data) async {
    dataSelecionada = data;
    final todasAsTarefas = await _databaseService.getAllTarefas();
    final filteredTarefas =
        todasAsTarefas.where((tarefa) => tarefa.data == data).toList();
    tarefas.clear();
    tarefas.addAll(filteredTarefas);
  }

  @action
  Future<void> filtrarPorPrioridade(Prioridade prioridade) async {
    prioridadeSelecionada = prioridade;
    tarefas = ObservableList.of(
        await _databaseService.getTarefasPorPrioridade(prioridade));
  }

  // Método para carregar tarefas do banco de dados ao inicializar a store
  @action
  Future<void> carregarTarefas() async {
    tarefas = ObservableList.of(await _databaseService.getAllTarefas());
  }

  @action
  Future<void> carregaLista() async {
    tarefas = ObservableList.of(await _databaseService.getAllTarefas())
        .toList()
        .asObservable();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste_jnmoura/controller/store/tarefa_store.dart';
import 'package:teste_jnmoura/models/tarefa_models.dart';
import 'package:teste_jnmoura/pages/tarefa_form.dart';

class TarefaPages extends StatefulWidget {
  const TarefaPages({
    Key? key,
  }) : super(key: key);

  @override
  State<TarefaPages> createState() => _TarefaPagesState();
}

class _TarefaPagesState extends State<TarefaPages> {
  final _tarefaStore = TarefaStore();

  Future<void> _consultarPorData() async {
    final DateTime? dataSelecionada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );

    if (dataSelecionada != null) {
      _tarefaStore.filtrarPorData(dataSelecionada);
    }
  }

  Future<void> _consultarPorPrioridade() async {
    Prioridade? prioridadeSelecionada;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Selecione a Prioridade'),
          content: DropdownButtonFormField<Prioridade>(
            value: _tarefaStore.prioridadeSelecionada,
            onChanged: (value) {
              setState(() {
                prioridadeSelecionada = value;
              });
            },
            items: Prioridade.values
                .map((prioridade) => DropdownMenuItem(
                      value: prioridade,
                      child: Text(prioridade.toString().split('.').last),
                    ))
                .toList(),
            decoration: const InputDecoration(
              labelText: 'Prioridade',
              border: OutlineInputBorder(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (prioridadeSelecionada != null) {
                  _tarefaStore.filtrarPorPrioridade(prioridadeSelecionada!);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _consultarPorData();
            },
            icon: const Icon(Icons.event),
          ),
          IconButton(
            onPressed: () {
              _consultarPorPrioridade();
            },
            icon: const Icon(Icons.filter_list),
          ),
        ],
      ),
      body: SafeArea(
        child: Observer(builder: (_) {
          return ListView.builder(
            itemCount: _tarefaStore.tarefas.length,
            itemBuilder: (BuildContext context, int i) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TarefaForm(
                          tarefa: _tarefaStore.tarefas[i],
                          tarefaStore: _tarefaStore,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    child: ListTile(
                      title: Text(
                        _tarefaStore.tarefas[i].descricaoCompleta(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        _tarefaStore.tarefas[i].prioridade.toString(),
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      trailing: TextButton(
                        onPressed: () {
                          setState(() {
                            _tarefaStore.mudarStatus(_tarefaStore.tarefas[i]);
                          });
                        },
                        child: const Text("Mudar status"),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TarefaForm(
                tarefaStore: _tarefaStore,
              ),
            ),
          );
          setState(() {});
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}

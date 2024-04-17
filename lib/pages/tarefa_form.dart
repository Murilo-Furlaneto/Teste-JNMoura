import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_jnmoura/controller/store/tarefa_store.dart';
import 'package:teste_jnmoura/models/tarefa_models.dart';

class TarefaForm extends StatefulWidget {
  final Tarefa? tarefa;
  final TarefaStore tarefaStore;

  const TarefaForm({Key? key, this.tarefa, required this.tarefaStore})
      : super(key: key);

  @override
  State<TarefaForm> createState() => _TarefaFormState();
}

class _TarefaFormState extends State<TarefaForm> {
  final TextEditingController _descricaoController = TextEditingController();
  DateTime _dataSelecionada = DateTime.now();
  TimeOfDay _horaSelecionada = TimeOfDay.now();
  Prioridade _prioridadeSelecionada = Prioridade.alta;
  bool _concluida = false;

  @override
  void initState() {
    super.initState();
    if (widget.tarefa != null) {
      preencherDados(widget.tarefa!);
    }
  }

  void preencherDados(Tarefa tarefa) {
    _descricaoController.text = tarefa.descricao;
    _dataSelecionada = tarefa.data;
    _horaSelecionada = TimeOfDay.fromDateTime(tarefa.hora);
    _prioridadeSelecionada = tarefa.prioridade;
    _concluida = tarefa.concluida;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.tarefa != null ? 'Editar Tarefa' : 'Cadastrar Tarefa'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _descricaoController,
                decoration: const InputDecoration(labelText: 'Descrição'),
              ),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () async {
                  final dataSelecionada = await showDatePicker(
                    context: context,
                    initialDate: _dataSelecionada,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (dataSelecionada != null) {
                    setState(() {
                      _dataSelecionada = dataSelecionada;
                    });
                  }
                },
                child: Text(
                  DateFormat('dd/MM/yyyy').format(_dataSelecionada),
                ),
              ),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () async {
                  final horaSelecionada = await showTimePicker(
                    context: context,
                    initialTime: _horaSelecionada,
                  );
                  if (horaSelecionada != null) {
                    setState(() {
                      _horaSelecionada = horaSelecionada;
                    });
                  }
                },
                child: Text(
                  _horaSelecionada.format(context),
                ),
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<Prioridade>(
                value: _prioridadeSelecionada,
                onChanged: (value) {
                  setState(() {
                    _prioridadeSelecionada = value!;
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
                ),
              ),
              const SizedBox(height: 16.0),
              widget.tarefa != null
                  ? CheckboxListTile(
                      title: const Text('Concluída'),
                      value: _concluida,
                      onChanged: (value) {
                        setState(() {
                          _concluida = value!;
                        });
                      },
                    )
                  : Container(),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (widget.tarefa != null) {
                    // Se uma tarefa já existe, editar a tarefa existente

                    Tarefa tarefaAtualizada = Tarefa(
                      id: widget.tarefa!.id,
                      descricao: _descricaoController.text,
                      data: _dataSelecionada,
                      hora: DateTime(
                        _dataSelecionada.year,
                        _dataSelecionada.month,
                        _dataSelecionada.day,
                        _horaSelecionada.hour,
                        _horaSelecionada.minute,
                      ),
                      prioridade: _prioridadeSelecionada,
                      concluida: _concluida,
                    );

                    widget.tarefaStore.atualizarTarefa(tarefaAtualizada);

                    Navigator.pop(context);
                  } else {
                    // Caso contrário, adicionar uma nova tarefa

                    Tarefa novaTarefa = Tarefa(
                      id: Random().nextInt(1000),
                      descricao: _descricaoController.text,
                      data: _dataSelecionada,
                      hora: DateTime(
                          _dataSelecionada.year,
                          _dataSelecionada.month,
                          _dataSelecionada.day,
                          _horaSelecionada.hour,
                          _horaSelecionada.minute),
                      prioridade: _prioridadeSelecionada,
                      concluida: _concluida,
                    );

                    widget.tarefaStore.adicionarTarefa(novaTarefa);

                    Navigator.pop(context);
                  }
                },
                child: Text(widget.tarefa != null ? 'Editar' : 'Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

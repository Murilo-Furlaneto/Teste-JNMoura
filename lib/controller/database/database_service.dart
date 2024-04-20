import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:teste_jnmoura/models/tarefa_models.dart';

class DatabaseService {
  Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initialize();
    return _database!;
  }

  Future<String> get fullPath async {
    const name = 'tarefa.bd';
    final path = await getDatabasesPath();
    return join(path, name);
  }

  Future<Database> _initialize() async {
    final path = await fullPath;
    var database = await openDatabase(path,
        version: 1, onCreate: _create, singleInstance: true);
    return database;
  }

  Future<void> _create(Database database, int version) async {
    await database.execute('''
    CREATE TABLE tarefas(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      descricao TEXT,
      data TEXT,
      hora TEXT,
      prioridade TEXT,
      concluida INTEGER
    );
  ''');
  }

  Future<void> insertTarefa(Tarefa tarefa) async {
    final db = await database;
    await db!.insert('tarefas', tarefa.toMap());
  }

  Future<void> updateTarefa(Tarefa tarefa) async {
    final db = await database;
    await db!.update(
      'tarefas',
      tarefa.toMap(),
      where: 'id = ?',
      whereArgs: [tarefa.id],
    );
  }

  Future<List<Tarefa>> getTarefasPorData(DateTime data) async {
    final db = await database;
    final DateTime dataInicial = DateTime(data.year, data.month, data.day);
    final DateTime dataFinal = dataInicial.add(const Duration(days: 1));
    final List<Map<String, dynamic>> maps = await db!.query(
      'tarefas',
      where: 'data >= ? AND data < ?',
      whereArgs: [
        DateFormat('yyyy-MM-dd').format(dataInicial),
        DateFormat('yyyy-MM-dd').format(dataFinal)
      ],
    );
    return List.generate(maps.length, (i) {
      return Tarefa.fromMap(maps[i]);
    });
  }

  Future<List<Tarefa>> getTarefasPorPrioridade(Prioridade prioridade) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query(
      'tarefas',
      where: 'prioridade = ?',
      whereArgs: [prioridade.toString()],
    );
    return List.generate(maps.length, (i) {
      return Tarefa.fromMap(maps[i]);
    });
  }

  Future<List<Tarefa>> getAllTarefas() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query('tarefas');
    return List.generate(maps.length, (i) {
      return Tarefa.fromMap(maps[i]);
    });
  }
}

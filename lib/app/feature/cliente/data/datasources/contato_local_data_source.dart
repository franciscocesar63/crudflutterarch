import 'package:crudflutter/app/feature/cliente/presentation/cliente_form/models/contato_model.dart';

import '../../../../core/database/database_info.dart';

abstract class ContatoLocalDataSource {
  Future<List<Contato>> findAll();

  Future<Contato> findById(int id);
}

class ContatoLocalDataSourceImpl extends ContatoLocalDataSource {
  final String table = "CONTATO";
  final DatabaseInfo databaseInfo;

  ContatoLocalDataSourceImpl({required this.databaseInfo});

  @override
  Future<List<Contato>> findAll() async {
    final database = await databaseInfo.database;

    final sql = 'SELECT ID, NOME, TELEFONE FROM CONTATO';

    final result = await database.rawQuery(sql);

    List<Contato> listaContato =
        result.map((element) => Contato.fromMap(element)).toList();

    return listaContato;
  }

  @override
  Future<Contato> findById(int id) async {
    final database = await databaseInfo.database;

    final sql = 'SELECT ID, NOME, TELEFONE FROM CONTATO';

    final result = await database.rawQuery(sql);

    List<Contato> listaContato =
        result.map((element) => Contato.fromMap(element)).toList();

    Contato contato = listaContato[0];

    return listaContato.isNotEmpty ? contato : Contato();
  }
}

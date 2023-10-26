import '../../../../core/database/database_info.dart';
import '../models/cliente_model.dart';

abstract class ClienteLocalDataSource {
  Future<ClienteModel> insert(ClienteModel clienteModel);

  Future<ClienteModel> update(ClienteModel clienteModel);

  Future<ClienteModel> delete(ClienteModel clienteModel);

  Future<List<ClienteModel>> findAll();
}

class ClienteLocalDataSourceImpl extends ClienteLocalDataSource {
  final String table = "CLIENTE";
  final DatabaseInfo databaseInfo;

  ClienteLocalDataSourceImpl({required this.databaseInfo});

  @override
  Future<ClienteModel> insert(ClienteModel clienteModel) async {
    final map = clienteModel.toMap();
    final database = await databaseInfo.database;

    final id = await database.insert(table, map);
    map['ID'] = id;

    return ClienteModel.fromMap(map);
  }

  @override
  Future<ClienteModel> update(ClienteModel cliente) async {
    final map = cliente.toMap();
    final database = await databaseInfo.database;

    final sql =
        "UPDATE CLIENTE SET NOME = '${cliente.nome}', CPFCNPJ = '${cliente.cpfcnpj}', IDCONTATO = ${cliente.idcontato} "
        "WHERE ID = ${cliente.id}";

    // final result = await database.rawQuery(sql);
    database.rawUpdate(sql);

    return ClienteModel.fromMap(map);
  }

  @override
  Future<ClienteModel> delete(ClienteModel cliente) async {
    final map = cliente.toMap();
    final database = await databaseInfo.database;

    final sql =
        "DELETE FROM CLIENTE "
        "WHERE ID = ${cliente.id}";

    database.rawDelete(sql);

    return ClienteModel.fromMap(map);
  }

  @override
  Future<List<ClienteModel>> findAll() async {
    final database = await databaseInfo.database;

    final sql = 'SELECT ID, NOME, CPFCNPJ, IDCONTATO FROM CLIENTE';

    final result = await database.rawQuery(sql);

    List<ClienteModel> listaClientes =
        result.map((element) => ClienteModel.fromMap(element)).toList();

    return listaClientes;
  }
}

import '../../domain/entities/cliente.dart';
import '../../domain/repositories/cliente_repository.dart';
import '../datasources/cliente_local_data_source.dart';
import '../models/cliente_model.dart';

class ClienteRepositoryImpl extends ClienteRepository {
  final ClienteLocalDataSource localDataSource;

  ClienteRepositoryImpl({required this.localDataSource});

  @override
  Future<Cliente> insert(Cliente cliente) async {
    final clienteModel = ClienteModel.fromEntity(cliente);
    Cliente obj = await localDataSource.insert(clienteModel);
    print("insert repository ${cliente.id}");
    return obj;
  }

  @override
  Future<Cliente> update(Cliente cliente) async {
    final clienteModel = ClienteModel.fromEntity(cliente);
    print("update repository ${cliente.id}");
    return await localDataSource.update(clienteModel);
  }

  @override
  Future<Cliente> delete(Cliente cliente) async {
    final clienteModel = ClienteModel.fromEntity(cliente);
    print("delete repository ${cliente.id}");
    return await localDataSource.delete(clienteModel);
  }

  @override
  Future<List<Cliente>> findAll() async {
    final response = await localDataSource.findAll();

    return response;
  }
}

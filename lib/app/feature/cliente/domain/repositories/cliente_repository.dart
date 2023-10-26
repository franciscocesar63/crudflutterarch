import '../entities/cliente.dart';

abstract class ClienteRepository {
  Future<Cliente> insert(Cliente cliente);
  Future<Cliente> update(Cliente cliente);
  Future<Cliente> delete(Cliente cliente);
  Future<List<Cliente>> findAll();
}

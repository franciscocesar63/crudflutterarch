import '../entities/cliente.dart';
import '../repositories/cliente_repository.dart';

class GetListCliente {
  final ClienteRepository repository;

  GetListCliente(this.repository);

  Future<List<Cliente>> call() async => repository.findAll();
}

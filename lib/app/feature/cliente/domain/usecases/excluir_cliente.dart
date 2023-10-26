import 'package:crudflutter/app/core/usecase/usecases.dart';
import 'package:equatable/equatable.dart';

import '../entities/cliente.dart';
import '../repositories/cliente_repository.dart';

class DeletarCliente extends UseCase<Cliente> {
  final ClienteRepository repository;

  DeletarCliente(this.repository);

  @override
  Future<Cliente> call(Cliente cliente) async {
    print("deletar? ${cliente.id}");
    return  await repository.delete(cliente);
  }
}

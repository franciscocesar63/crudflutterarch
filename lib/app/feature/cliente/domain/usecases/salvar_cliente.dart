import 'package:crudflutter/app/core/usecase/usecases.dart';
import 'package:equatable/equatable.dart';

import '../entities/cliente.dart';
import '../repositories/cliente_repository.dart';

class GetSalvarCliente extends UseCase<Cliente> {
  final ClienteRepository repository;

  GetSalvarCliente(this.repository);

  @override
  Future<Cliente> call(Cliente cliente) async {
    print("update? ${cliente.id}");
    return cliente.id == null ? await repository.insert(cliente) : await repository.update(cliente);
  }
}

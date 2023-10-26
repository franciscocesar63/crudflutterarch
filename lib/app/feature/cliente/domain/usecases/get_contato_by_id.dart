import '../../presentation/cliente_form/models/contato_model.dart';
import '../repositories/contato_repository.dart';

class GetContatoById {
  final ContatoRepository repository;

  GetContatoById(this.repository);

  Future<Contato> call(int id) async => repository.findById(id);
}

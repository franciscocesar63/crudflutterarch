import '../../presentation/cliente_form/models/contato_model.dart';
import '../repositories/contato_repository.dart';

class GetListContato {
  final ContatoRepository repository;

  GetListContato(this.repository);

  Future<List<Contato>> call() async => repository.findAll();
}

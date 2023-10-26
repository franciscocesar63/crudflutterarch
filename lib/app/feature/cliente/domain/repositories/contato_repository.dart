import '../../presentation/cliente_form/models/contato_model.dart';

abstract class ContatoRepository {
  Future<List<Contato>> findAll();
  Future<Contato> findById(int id);
}

import '../../domain/repositories/contato_repository.dart';
import '../../presentation/cliente_form/models/contato_model.dart';
import '../datasources/contato_local_data_source.dart';

class ContatoRepositoryImpl extends ContatoRepository {
  final ContatoLocalDataSource localDataSource;

  ContatoRepositoryImpl({required this.localDataSource});

  @override
  Future<List<Contato>> findAll() async {
    final response = await localDataSource.findAll();

    return response;
  }

  @override
  Future<Contato> findById(int id) async {
    final response = await localDataSource.findById(id);

    return response;
  }
}

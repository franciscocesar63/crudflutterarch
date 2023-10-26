import 'package:crudflutter/app/feature/cliente/domain/usecases/get_list_contato.dart';
import 'package:crudflutter/app/feature/cliente/domain/usecases/salvar_cliente.dart';
import 'package:get/get.dart';

import '../../../../../core/database/database_info.dart';
import '../../../data/datasources/cliente_local_data_source.dart';
import '../../../data/datasources/contato_local_data_source.dart';
import '../../../data/repositories/cliente_repository_impl.dart';
import '../../../data/repositories/contato_repository_impl.dart';
import '../../../domain/repositories/cliente_repository.dart';
import '../../../domain/repositories/contato_repository.dart';
import '../../../domain/usecases/get_contato_by_id.dart';
import 'cliente_form_controller.dart';

class ClienteFormBindings extends Bindings {
  @override
  void dependencies() {
    //DataSource
    Get.put<DatabaseInfo>(
      DatabaseInfoImpl(),
    );

    Get.put<ClienteLocalDataSource>(
      ClienteLocalDataSourceImpl(
        databaseInfo: Get.find(),
      ),
    );

    Get.put<ContatoLocalDataSource>(
      ContatoLocalDataSourceImpl(
        databaseInfo: Get.find(),
      ),
    );

    //Repository
    Get.put<ClienteRepository>(
      ClienteRepositoryImpl(
        localDataSource: Get.find(),
      ),
    );
    Get.put<ContatoRepository>(
      ContatoRepositoryImpl(
        localDataSource: Get.find(),
      ),
    );

    //UseCases
    Get.put(GetSalvarCliente(Get.find()));
    Get.put(GetListContato(Get.find()));
    Get.put(GetContatoById(Get.find()));

    // Controller
    Get.put(ClienteFormController(
      salvarCliente: Get.find(),
      getListContato: Get.find(),
      getContatoById: Get.find(),
    ));
  }
}

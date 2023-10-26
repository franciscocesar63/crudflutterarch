import 'package:crudflutter/app/feature/cliente/domain/usecases/excluir_cliente.dart';
import 'package:crudflutter/app/feature/cliente/domain/usecases/get_list_cliente.dart';
import 'package:get/get.dart';

import '../../../../../core/database/database_info.dart';
import '../../../data/datasources/cliente_local_data_source.dart';
import '../../../data/repositories/cliente_repository_impl.dart';
import '../../../domain/repositories/cliente_repository.dart';
import 'cliente_controller.dart';

class ClienteBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<DatabaseInfo>(
      DatabaseInfoImpl(),
    );

    Get.put<ClienteLocalDataSource>(
      ClienteLocalDataSourceImpl(
        databaseInfo: Get.find(),
      ),
    );

    //Repository
    Get.put<ClienteRepository>(
      ClienteRepositoryImpl(
        localDataSource: Get.find(),
      ),
    );
    //UseCases
    Get.put(GetListCliente(Get.find()));
    Get.put(DeletarCliente(Get.find()));

    // Controller
    Get.put(ClienteController(
      getListCliente: Get.find(),
      deletarCliente: Get.find(),
    ));
  }
}

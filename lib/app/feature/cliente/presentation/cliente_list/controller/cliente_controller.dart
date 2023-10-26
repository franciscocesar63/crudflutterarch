import 'package:get/get.dart';

import '../../../domain/entities/cliente.dart';
import '../../../domain/usecases/excluir_cliente.dart';
import '../../../domain/usecases/get_list_cliente.dart';

class ClienteController extends GetxController {
  final GetListCliente getListCliente;
  final DeletarCliente deletarCliente;

  ClienteController(
      {required this.getListCliente, required this.deletarCliente});

  final RxBool _isLoading = false.obs;

  RxBool get isLoading => _isLoading;
  final RxInt _clienteSize = 0.obs;

  RxInt get clienteSize => _clienteSize;

  RxList<Cliente> _listaCliente = <Cliente>[].obs;

  RxList<Cliente> get listaCliente => _listaCliente;

  set listaCliente(RxList<Cliente> value) => _listaCliente = value;

  Future<List<Cliente>> findAll() async {
    isLoading.value = true;
    List<Cliente> list = await getListCliente.call();
    clienteSize.value = list.length;
    print("size == ${clienteSize}");
    listaCliente(list);
    isLoading.value = false;
    return list;
  }
}

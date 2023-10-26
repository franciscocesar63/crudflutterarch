import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../master/home/controller/home_controller.dart';
import '../../../../../routes/app_routes.dart';
import '../../../domain/entities/cliente.dart';
import '../controller/cliente_controller.dart';

class ClienteListPage extends GetView<ClienteController> {
  const ClienteListPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.findAll();
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _floatButton(),
    );
  }

  _buildBody() {
    return controller.listaCliente.isEmpty
        ? const Center(child: Text("Não há clientes cadastrados!"))
        : Obx(() => ListView.builder(
              itemCount: controller.listaCliente.length,
              itemBuilder: (BuildContext context, int index) {
                final cliente = controller.listaCliente[index];
                return Dismissible(
                  background: Container(
                    color: Colors.redAccent,
                  ),
                  key: Key("${cliente.id}"),
                  onDismissed: (direction) {
                    controller.deletarCliente(cliente);
                    controller.findAll();
                  },
                  child: ListTile(
                    title: Text("${cliente.id} - ${cliente.nome}"),
                    subtitle: Text("Cpf/Cnpj: ${cliente.cpfcnpj}"),
                    onTap: () async {
                      var result = await Get.toNamed(AppRoutes.formCliente,
                          arguments: cliente);
                      if (result == true) {
                        controller.findAll();
                      }
                    },
                  ),
                );
              },
            ));
  }
}

_buildBodyFuture() {
  // return Obx(
  //       () =>
  //       FutureBuilder<List<Cliente>>(
  // future: controller.listaCliente.value,
  //           builder: (_, snapshot) {
  //             if (snapshot.connectionState == ConnectionState.waiting) {
  //               return const Center(
  //                 child: CircularProgressIndicator(),
  //               );
  //             } else if (snapshot.hasError) {
  //               return Center(
  //                 child: Text('Ocorreu um erro: ${snapshot.error}'),
  //               );
  //             } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
  //               return const Center(
  //                 child: Text('Nenhum cliente encontrado.'),
  //               );
  //             } else {
  //               return ListView.builder(
  //                 itemCount: controller.clienteSize.value,
  //                 itemBuilder: (BuildContext context, int index) {
  //                   final cliente = snapshot.data![index];
  //                   return ListTile(
  //                     title: Text("ID: ${cliente.id}"),
  //                     subtitle: Text("Nome: ${cliente.nome}"),
  //                     onTap: () async {
  //                       var result = await Get.toNamed(AppRoutes.formCliente,
  //                           arguments: cliente);
  //                       if (result == true) {
  //                         controller.update();
  //                       }
  //                     },
  //                   );
  //                 },
  //               );
  //             }
  //           }),
  // );
}

_floatButton() {
  return FloatingActionButton(
    child: const Icon(Icons.add),
    onPressed: () {
      Get.toNamed(AppRoutes.formCliente);
    },
  );
}

_buildAppBar() {
  return AppBar(
    title: const Text("Clientes"),
    centerTitle: true,
  );
}

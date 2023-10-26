import 'package:crudflutter/app/feature/cliente/data/models/cliente_model.dart';
import 'package:crudflutter/app/feature/cliente/presentation/cliente_form/models/contato_model.dart';
import 'package:crudflutter/app/feature/cliente/presentation/cliente_list/controller/cliente_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/cliente_form_controller.dart';

class ClienteFormPage extends GetView<ClienteFormController> {
  ClienteFormPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool isEdit = false;
    ClienteModel model =
        ClienteModel(id: -999, nome: "", cpfcnpj: "", idcontato: -1);
    if (Get.arguments != null) {
      isEdit = true;
      model = Get.arguments as ClienteModel;
    }
    controller.itensContatosDropdown(isEdit, model.idcontato!);

    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? "Editar Cliente" : "Novo Cliente")),
      body: Obx(
        () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      initialValue: isEdit ? "${model.nome}" : "",
                      decoration: const InputDecoration(
                        hintText: 'Insira o seu nome',
                        labelText: 'Nome',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, insira o seu nome.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        controller.setNome(value!);
                      },
                    ),
                    TextFormField(
                      initialValue: isEdit ? "${model.cpfcnpj}" : "",
                      decoration: const InputDecoration(
                        hintText: 'Insira o seu CPF/CNPJ',
                        labelText: 'CPF/CNPJ',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, insira o seu CPF ou CNPJ.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        controller.setCpf(value!);
                      },
                    ),
                    DropdownButton<Contato>(
                      value: controller.contatoSelected.value,
                      items: controller.itensContatos,
                      onChanged: (Contato? value) {
                        controller.contatoSelected.value = value!;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            if (controller.validate()) {
                              ClienteModel clientee = ClienteModel(
                                  id: isEdit ? model.id : null,
                                  nome: controller.nome.value,
                                  cpfcnpj: controller.cpf.value,
                                  idcontato:
                                      controller.contatoSelected.value.id);
                              controller.insert(clientee);

                              final ClienteController homeController =
                                  Get.find<ClienteController>();
                              homeController.findAll();

                              Get.back(result: true);
                            }
                          }
                        },
                        child: const Center(
                          child: Text('Salvar'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

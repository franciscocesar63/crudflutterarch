import 'package:crudflutter/app/feature/cliente/domain/entities/cliente.dart';
import 'package:crudflutter/app/feature/cliente/domain/usecases/salvar_cliente.dart';
import 'package:crudflutter/app/feature/cliente/presentation/cliente_form/models/contato_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/usecases/get_contato_by_id.dart';
import '../../../domain/usecases/get_list_contato.dart';

class ClienteFormController extends GetxController {
  final GetSalvarCliente salvarCliente;
  final GetListContato getListContato;
  final GetContatoById getContatoById;

  ClienteFormController(
      {required this.salvarCliente,
      required this.getListContato,
      required this.getContatoById});

  var nome = ''.obs;
  var cpf = ''.obs;
  final RxBool _isLoading = false.obs;
  RxList<DropdownMenuItem<Contato>> _itensContatos =
      <DropdownMenuItem<Contato>>[].obs;
  var contatoSelected = Contato(nome: "Selecione o contato", id: -999).obs;
  late RxString _contato = "".obs;

  RxList<DropdownMenuItem<Contato>> get itensContatos => _itensContatos;

  set itensContatos(RxList<DropdownMenuItem<Contato>> value) {
    _itensContatos = value;
  }

  RxString get contato => _contato;

  RxBool get isLoading => _isLoading;

  set contato(RxString value) {
    _contato = value;
  }

  void setNome(String value) {
    nome.value = value;
  }

  void setCpf(String value) {
    cpf.value = value;
  }

  bool validate() {
    if (nome.value.isEmpty || cpf.value.isEmpty) {
      return false;
    }
    return true;
  }

  Future<bool> insert(Cliente c) async {
    isLoading.value = true;
    salvarCliente.call(c);
    isLoading.value = false;
    return true;
  }

  void itensContatosDropdown(bool isEdit, int idcontato) async {
    isLoading.value = true;

    List<Contato> x = await getListContato.call();

    List<DropdownMenuItem<Contato>> list = x
        .map((Contato e) => DropdownMenuItem(
            value: e, child: Text("${e.nome} - ${e.telefone}")))
        .toList();

    List<DropdownMenuItem<Contato>> menuItems = [
      DropdownMenuItem(
        value: contatoSelected.value,
        child: const Text("Selecione o contato"),
      ),
    ];

    menuItems.addAll(list);

    itensContatos(menuItems);

    if (isEdit) {
      itensContatos.forEach((e) {
        if (e.value!.id == idcontato) {
          contatoSelected.value = e.value!;
        }
      });
    }

    isLoading.value = false;
  }
}

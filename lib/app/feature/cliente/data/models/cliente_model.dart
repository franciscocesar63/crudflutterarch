import 'package:crudflutter/app/feature/cliente/domain/entities/cliente.dart';

class ClienteModel extends Cliente {
  ClienteModel(
      {required super.id, required super.nome, required super.cpfcnpj, required super.idcontato});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ID': id,
      'NOME': nome,
      'CPFCNPJ': cpfcnpj,
      'IDCONTATO': idcontato
    };
  }

  factory ClienteModel.fromMap(Map<String, dynamic> map) {
    return ClienteModel(
      id: map['ID'],
      nome: map['NOME'],
      cpfcnpj: map['CPFCNPJ'],
      idcontato: map['IDCONTATO'],
    );
  }

  factory ClienteModel.fromEntity(Cliente cliente) {
    return ClienteModel(
      id: cliente.id,
      nome: cliente.nome,
      cpfcnpj: cliente.cpfcnpj,
      idcontato: cliente.idcontato,
    );
  }
}

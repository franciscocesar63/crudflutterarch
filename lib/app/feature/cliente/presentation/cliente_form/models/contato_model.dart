class Contato {
  int? id;
  String? nome;
  String? telefone;

  Contato({this.id, this.nome, this.telefone});

  @override
  String toString() {
    return '$nome - $telefone';
  }

  factory Contato.fromMap(Map<String, dynamic> map) {
    return Contato(
      id: map['ID'],
      nome: map['NOME'],
      telefone: map['TELEFONE'],
    );
  }
}

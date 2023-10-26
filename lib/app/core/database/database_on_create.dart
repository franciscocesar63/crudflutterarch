import 'dart:developer';

import 'package:sqflite/sqflite.dart';

Future<void> _execute(
  Database database,
  String identificador,
  String sql,
) async {
  log(">>>>>>> $identificador");
  await database.execute(sql);
}

Future<void> onCreate(
  Database database,
  int version,
) async {
  await _execute(
      database,
      "CLIENTE",
      "CREATE TABLE IF NOT EXISTS `CLIENTE` (  "
          "`ID` INTEGER  PRIMARY KEY AUTOINCREMENT,  "
          "`IDCONTATO` INTEGER  NOT NULL,  "
          "`NOME` VARCHAR(100) NOT NULL,  "
          "`CPFCNPJ` VARCHAR(18) NOT NULL);");
  await _execute(
      database,
      "CONTATO",
      "CREATE TABLE IF NOT EXISTS `CONTATO` (  "
          "`ID` INTEGER  PRIMARY KEY AUTOINCREMENT,  "
          "`NOME` VARCHAR(100) NOT NULL,  "
          "`TELEFONE` VARCHAR(18)NOT NULL);");
  await _execute(
      database,
      "CONTATO",
      "INSERT INTO CONTATO (NOME,TELEFONE) VALUES ('JOAO FRANCISCO','83 9 9999-9999');");  await _execute(
      database,
      "CONTATO",
      "INSERT INTO CONTATO (NOME,TELEFONE) VALUES ('MARIA JOSE','83 9 8888-8888');");  await _execute(
      database,
      "CONTATO",
      "INSERT INTO CONTATO (NOME,TELEFONE) VALUES ('GUILHERME PROFETA','83 9 7777-7777');");
}

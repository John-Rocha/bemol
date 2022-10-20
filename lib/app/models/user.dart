// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String name;
  final String lastName;
  final String birth;
  final String gender;
  final String cpf;
  final String rg;
  final String cep;
  final String logradouro;
  final String complemento;
  final String? number;
  final String bairro;
  final String localidade;
  final String uf;
  final String email;

  User({
    required this.name,
    required this.lastName,
    required this.birth,
    required this.gender,
    required this.cpf,
    required this.rg,
    required this.cep,
    required this.logradouro,
    required this.complemento,
    this.number,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'lastName': lastName,
      'birth': birth,
      'gender': gender,
      'cpf': cpf,
      'rg': rg,
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'number': number,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      lastName: map['lastName'] as String,
      birth: map['birth'] as String,
      gender: map['gender'] as String,
      cpf: map['cpf'] as String,
      rg: map['rg'] as String,
      cep: map['cep'] as String,
      logradouro: map['logradouro'] as String,
      complemento: map['complemento'] as String,
      number: map['number'] != null ? map['number'] as String : null,
      bairro: map['bairro'] as String,
      localidade: map['localidade'] as String,
      uf: map['uf'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}

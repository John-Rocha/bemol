// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String? name;
  final String? lastName;
  final String? birth;
  final String? gender;
  final String? cpf;
  final String? rg;
  final String? cep;
  final String? logradouro;
  final String? complemento;
  final String? number;
  final String? bairro;
  final String? localidade;
  final String? uf;
  final String? email;
  final String? password;

  UserModel({
    this.name,
    this.lastName,
    this.birth,
    this.gender,
    this.cpf,
    this.rg,
    this.cep,
    this.logradouro,
    this.complemento,
    this.number,
    this.bairro,
    this.localidade,
    this.uf,
    this.email,
    this.password,
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
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] != null ? map['name'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      birth: map['birth'] != null ? map['birth'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      cpf: map['cpf'] != null ? map['cpf'] as String : null,
      rg: map['rg'] != null ? map['rg'] as String : null,
      cep: map['cep'] != null ? map['cep'] as String : null,
      logradouro:
          map['logradouro'] != null ? map['logradouro'] as String : null,
      complemento:
          map['complemento'] != null ? map['complemento'] as String : null,
      number: map['number'] != null ? map['number'] as String : null,
      bairro: map['bairro'] != null ? map['bairro'] as String : null,
      localidade:
          map['localidade'] != null ? map['localidade'] as String : null,
      uf: map['uf'] != null ? map['uf'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
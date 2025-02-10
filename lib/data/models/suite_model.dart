import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'categoria_model.dart';
import 'item_model.dart';
import 'periodo_model.dart';

class SuiteModel {
  final String nome;
  final int qtd;
  final bool exibirQtdDisponiveis;
  final List<String> fotos;
  final List<ItemModel> itens;
  final List<CategoriaItemModel> categoriaItens;
  final List<PeriodoModel> periodos;

  SuiteModel({
    required this.nome,
    required this.qtd,
    required this.exibirQtdDisponiveis,
    required this.fotos,
    required this.itens,
    required this.categoriaItens,
    required this.periodos,
  });

  SuiteModel copyWith({
    String? nome,
    int? qtd,
    bool? exibirQtdDisponiveis,
    List<String>? fotos,
    List<ItemModel>? itens,
    List<CategoriaItemModel>? categoriaItens,
    List<PeriodoModel>? periodos,
  }) {
    return SuiteModel(
      nome: nome ?? this.nome,
      qtd: qtd ?? this.qtd,
      exibirQtdDisponiveis: exibirQtdDisponiveis ?? this.exibirQtdDisponiveis,
      fotos: fotos ?? this.fotos,
      itens: itens ?? this.itens,
      categoriaItens: categoriaItens ?? this.categoriaItens,
      periodos: periodos ?? this.periodos,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'qtd': qtd,
      'exibirQtdDisponiveis': exibirQtdDisponiveis,
      'fotos': fotos,
      'itens': itens.map((x) => x.toJson()).toList(),
      'categoriaItens': categoriaItens.map((x) => x.toMap()).toList(),
      'periodos': periodos.map((x) => x.toJson()).toList(),
    };
  }

  factory SuiteModel.fromMap(Map<String, dynamic> map) {
    return SuiteModel(
      nome: map['nome'] as String,
      qtd: map['qtd'] as int,
      exibirQtdDisponiveis: map['exibirQtdDisponiveis'] as bool,
      fotos: List<String>.from(map['fotos']),
      itens: List<ItemModel>.from(
        map['itens'].map((x) => ItemModel.fromJson(x as Map<String, dynamic>)),
      ),
      categoriaItens: List<CategoriaItemModel>.from(
        map['categoriaItens'].map(
          (x) => CategoriaItemModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      periodos: List<PeriodoModel>.from(
        map['periodos'].map(
          (x) => PeriodoModel.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory SuiteModel.fromJson(String source) =>
      SuiteModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SuiteModel(nome: $nome, qtd: $qtd, exibirQtdDisponiveis: $exibirQtdDisponiveis, fotos: $fotos, itens: $itens, categoriaItens: $categoriaItens, periodos: $periodos)';
  }

  @override
  bool operator ==(covariant SuiteModel other) {
    if (identical(this, other)) return true;

    return other.nome == nome &&
        other.qtd == qtd &&
        other.exibirQtdDisponiveis == exibirQtdDisponiveis &&
        listEquals(other.fotos, fotos) &&
        listEquals(other.itens, itens) &&
        listEquals(other.categoriaItens, categoriaItens) &&
        listEquals(other.periodos, periodos);
  }

  @override
  int get hashCode {
    return nome.hashCode ^
        qtd.hashCode ^
        exibirQtdDisponiveis.hashCode ^
        fotos.hashCode ^
        itens.hashCode ^
        categoriaItens.hashCode ^
        periodos.hashCode;
  }
}

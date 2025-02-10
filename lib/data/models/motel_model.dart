import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'suite_model.dart';

class MotelModel {
  final String fantasia;
  final String logo;
  final String bairro;
  final double distancia;
  final int qtdFavoritos;
  final List<SuiteModel> suites;

  MotelModel({
    required this.fantasia,
    required this.logo,
    required this.bairro,
    required this.distancia,
    required this.qtdFavoritos,
    required this.suites,
  });

  MotelModel copyWith({
    String? fantasia,
    String? logo,
    String? bairro,
    double? distancia,
    int? qtdFavoritos,
    List<SuiteModel>? suites,
  }) {
    return MotelModel(
      fantasia: fantasia ?? this.fantasia,
      logo: logo ?? this.logo,
      bairro: bairro ?? this.bairro,
      distancia: distancia ?? this.distancia,
      qtdFavoritos: qtdFavoritos ?? this.qtdFavoritos,
      suites: suites ?? this.suites,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fantasia': fantasia,
      'logo': logo,
      'bairro': bairro,
      'distancia': distancia,
      'qtdFavoritos': qtdFavoritos,
      'suites': suites.map((x) => x.toMap()).toList(),
    };
  }

  factory MotelModel.fromMap(Map<String, dynamic> map) {
    return MotelModel(
      fantasia: map['fantasia'] as String,
      logo: map['logo'] as String,
      bairro: map['bairro'] as String,
      distancia: map['distancia'] as double,
      qtdFavoritos: map['qtdFavoritos'] as int,
      suites: List<SuiteModel>.from(
        map['suites'].map(
          (x) => SuiteModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MotelModel.fromJson(String source) =>
      MotelModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MotelModel(fantasia: $fantasia, logo: $logo, bairro: $bairro, distancia: $distancia, qtdFavoritos: $qtdFavoritos, suites: $suites)';
  }

  @override
  bool operator ==(covariant MotelModel other) {
    if (identical(this, other)) return true;

    return other.fantasia == fantasia &&
        other.logo == logo &&
        other.bairro == bairro &&
        other.distancia == distancia &&
        other.qtdFavoritos == qtdFavoritos &&
        listEquals(other.suites, suites);
  }

  @override
  int get hashCode {
    return fantasia.hashCode ^
        logo.hashCode ^
        bairro.hashCode ^
        distancia.hashCode ^
        qtdFavoritos.hashCode ^
        suites.hashCode;
  }
}

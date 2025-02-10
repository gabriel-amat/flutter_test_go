import 'package:flutter/foundation.dart';
import 'motel_model.dart';

class DataModel {
  final int pagina;
  final int qtdPorPagina;
  final int totalSuites;
  final int totalMoteis;
  final int raio;
  final double maxPaginas;
  final List<MotelModel> moteis;

  DataModel({
    required this.pagina,
    required this.qtdPorPagina,
    required this.totalSuites,
    required this.totalMoteis,
    required this.raio,
    required this.maxPaginas,
    required this.moteis,
  });

  factory DataModel.empty() => DataModel(
        pagina: 0,
        qtdPorPagina: 0,
        totalSuites: 0,
        totalMoteis: 0,
        raio: 0,
        maxPaginas: 0,
        moteis: [],
      );

  DataModel copyWith({
    int? pagina,
    int? qtdPorPagina,
    int? totalSuites,
    int? totalMoteis,
    int? raio,
    double? maxPaginas,
    List<MotelModel>? moteis,
  }) {
    return DataModel(
      pagina: pagina ?? this.pagina,
      qtdPorPagina: qtdPorPagina ?? this.qtdPorPagina,
      totalSuites: totalSuites ?? this.totalSuites,
      totalMoteis: totalMoteis ?? this.totalMoteis,
      raio: raio ?? this.raio,
      maxPaginas: maxPaginas ?? this.maxPaginas,
      moteis: moteis ?? this.moteis,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'pagina': pagina,
      'qtdPorPagina': qtdPorPagina,
      'totalSuites': totalSuites,
      'totalMoteis': totalMoteis,
      'raio': raio,
      'maxPaginas': maxPaginas,
      'moteis': moteis.map((x) => x.toMap()).toList(),
    };
  }

  factory DataModel.fromJson(Map<String, dynamic> map) {
    return DataModel(
      pagina: map['pagina'] as int,
      qtdPorPagina: map['qtdPorPagina'] as int,
      totalSuites: map['totalSuites'] as int,
      totalMoteis: map['totalMoteis'] as int,
      raio: map['raio'] as int,
      maxPaginas: map['maxPaginas'] as double,
      moteis: List<MotelModel>.from(
        map['moteis'].map(
          (x) => MotelModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  @override
  String toString() {
    return 'DataModel(pagina: $pagina, qtdPorPagina: $qtdPorPagina, totalSuites: $totalSuites, totalMoteis: $totalMoteis, raio: $raio, maxPaginas: $maxPaginas, moteis: $moteis)';
  }

  @override
  bool operator ==(covariant DataModel other) {
    if (identical(this, other)) return true;

    return other.pagina == pagina &&
        other.qtdPorPagina == qtdPorPagina &&
        other.totalSuites == totalSuites &&
        other.totalMoteis == totalMoteis &&
        other.raio == raio &&
        other.maxPaginas == maxPaginas &&
        listEquals(other.moteis, moteis);
  }

  @override
  int get hashCode {
    return pagina.hashCode ^
        qtdPorPagina.hashCode ^
        totalSuites.hashCode ^
        totalMoteis.hashCode ^
        raio.hashCode ^
        maxPaginas.hashCode ^
        moteis.hashCode;
  }
}

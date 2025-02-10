import 'desconto_model.dart';

class PeriodoModel {
  String? tempoFormatado;
  String? tempo;
  double? valor;
  double? valorTotal;
  bool? temCortesia;
  DescontoModel? desconto;

  PeriodoModel({
    this.tempoFormatado,
    this.tempo,
    this.valor,
    this.valorTotal,
    this.temCortesia,
    this.desconto,
  });

  PeriodoModel copyWith({
    String? tempoFormatado,
    String? tempo,
    double? valor,
    double? valorTotal,
    bool? temCortesia,
    DescontoModel? desconto,
  }) {
    return PeriodoModel(
      tempoFormatado: tempoFormatado ?? this.tempoFormatado,
      tempo: tempo ?? this.tempo,
      valor: valor ?? this.valor,
      valorTotal: valorTotal ?? this.valorTotal,
      temCortesia: temCortesia ?? this.temCortesia,
      desconto: desconto ?? this.desconto,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tempoFormatado': tempoFormatado,
      'tempo': tempo,
      'valor': valor,
      'valorTotal': valorTotal,
      'temCortesia': temCortesia,
      'desconto': desconto?.toJson(),
    };
  }

  factory PeriodoModel.fromJson(Map<String, dynamic> map) {
    return PeriodoModel(
      tempoFormatado: map['tempoFormatado'] as String,
      tempo: map['tempo'] as String,
      valor: map['valor'] as double,
      valorTotal: map['valorTotal'] as double,
      temCortesia: map['temCortesia'] as bool,
      desconto:  map['desconto'] != null ? DescontoModel.fromJson(
        map['desconto'] as Map<String, dynamic>,
      ) : null,
    );
  }

  @override
  String toString() {
    return 'PeriodoModel(tempoFormatado: $tempoFormatado, tempo: $tempo, valor: $valor, valorTotal: $valorTotal, temCortesia: $temCortesia, desconto: $desconto)';
  }

  @override
  bool operator ==(covariant PeriodoModel other) {
    if (identical(this, other)) return true;

    return other.tempoFormatado == tempoFormatado &&
        other.tempo == tempo &&
        other.valor == valor &&
        other.valorTotal == valorTotal &&
        other.temCortesia == temCortesia &&
        other.desconto == desconto;
  }

  @override
  int get hashCode {
    return tempoFormatado.hashCode ^
        tempo.hashCode ^
        valor.hashCode ^
        valorTotal.hashCode ^
        temCortesia.hashCode ^
        desconto.hashCode;
  }
}

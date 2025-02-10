class DescontoModel {
  num desconto;

  DescontoModel({required this.desconto});

  DescontoModel copyWith({num? desconto}) {
    return DescontoModel(desconto: desconto ?? this.desconto);
  }

  Map<String, dynamic> toJson() {
    return {'desconto': desconto};
  }

  factory DescontoModel.fromJson(Map<String, dynamic> map) {
    return DescontoModel(desconto: map['desconto'] as num);
  }

  @override
  String toString() => 'DescontoModel(desconto: $desconto)';

  @override
  bool operator ==(covariant DescontoModel other) {
    if (identical(this, other)) return true;

    return other.desconto == desconto;
  }

  @override
  int get hashCode => desconto.hashCode;
}

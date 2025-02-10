import 'dart:convert';

class CategoriaItemModel {
  final String nome;
  final String icone;

  CategoriaItemModel({
    required this.nome,
    required this.icone,
  });

  CategoriaItemModel copyWith({
    String? nome,
    String? icone,
  }) {
    return CategoriaItemModel(
      nome: nome ?? this.nome,
      icone: icone ?? this.icone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'icone': icone,
    };
  }

  factory CategoriaItemModel.fromMap(Map<String, dynamic> map) {
    return CategoriaItemModel(
      nome: map['nome'] as String,
      icone: map['icone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriaItemModel.fromJson(String source) =>
      CategoriaItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CategoriaItemModel(nome: $nome, icone: $icone)';

  @override
  bool operator ==(covariant CategoriaItemModel other) {
    if (identical(this, other)) return true;

    return other.nome == nome && other.icone == icone;
  }

  @override
  int get hashCode => nome.hashCode ^ icone.hashCode;
}

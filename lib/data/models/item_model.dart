class ItemModel {
  final String nome;

  ItemModel({required this.nome});

  ItemModel copyWith({String? nome}) {
    return ItemModel(nome: nome ?? this.nome);
  }

  Map<String, dynamic> toJson() {
    return {'nome': nome};
  }

  factory ItemModel.fromJson(Map<String, dynamic> map) {
    return ItemModel(nome: map['nome'] as String);
  }
  @override
  String toString() => 'ItemModel(nome: $nome)';

  @override
  bool operator ==(covariant ItemModel other) {
    if (identical(this, other)) return true;

    return other.nome == nome;
  }

  @override
  int get hashCode => nome.hashCode;
}

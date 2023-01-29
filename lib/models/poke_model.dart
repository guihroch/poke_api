class PokeModel {
  final List<PokeModel>? pokeList;
  final String name;
  final String img;
  final int id;
  PokeModel({
    this.pokeList,
    required this.name,
    required this.img,
    required this.id,
  });

  factory PokeModel.fromJson(Map json) {
    return PokeModel(
      name: json['name'],
      img: json['img'],
      id: json['id'],
    );
  }

  PokeModel copyWith({
    List<PokeModel>? pokeList,
    String? name,
    String? img,
    int? id,
  }) {
    return PokeModel(
      pokeList: pokeList ?? this.pokeList,
      name: name ?? this.name,
      img: img ?? this.img,
      id: id ?? this.id,
    );
  }
}

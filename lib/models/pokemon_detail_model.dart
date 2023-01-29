class PokemonModel {
  int? id;
  String? url;
  String? name;
  int? order;
  List<Stats>? stats;
  List<Types>? types;

  PokemonModel({
    this.id,
    this.url,
    this.name,
    this.order,
    this.stats,
    this.types,
  });

  String? _setUrl(int? id) {
    if (id == null) {
      return null;
    }
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
  }

  int? _setId(int? id, String? url) {
    if (id == null && url != null) {
      final String idResult = url
          .replaceAll("https://pokeapi.co/api/v2/pokemon/", '')
          .replaceAll('/', '');
      try {
        return int.parse(idResult);
      } catch (_) {}
    }
    return id;
  }

  PokemonModel.fromJson(Map<String, dynamic> json) {
    id = _setId(json['id'], json['url']);
    url = _setUrl(json['id']);
    name = json['name'];
    order = json['order'];

    if (json['stats'] != null) {
      stats = [];
      json['stats'].forEach((v) {
        stats?.add(Stats.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = [];
      json['types'].forEach((v) {
        types?.add(Types.fromJson(v));
      });
    }
  }
}

class Ability {
  String? name;
  String? url;

  Ability({this.name, this.url});

  Ability.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class Stats {
  int? baseStat;
  int? effort;
  Ability? stat;

  Stats({this.baseStat, this.effort, this.stat});

  Stats.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'];
    effort = json['effort'];
    stat = json['stat'] != null ? Ability.fromJson(json['stat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['base_stat'] = baseStat;
    data['effort'] = effort;
    if (stat != null) {
      data['stat'] = stat?.toJson();
    }
    return data;
  }
}

class Types {
  int? slot;
  Ability? type;

  Types({this.slot, this.type});

  Types.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type = json['type'] != null ? Ability.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['slot'] = slot;
    if (type != null) {
      data['type'] = type?.toJson();
    }
    return data;
  }
}

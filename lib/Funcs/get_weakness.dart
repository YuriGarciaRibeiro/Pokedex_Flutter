Map<String, dynamic> getWeaknessesAndVantage(List<String> types) {
  Map<String, Map<String, dynamic>> relations = {
    "fire": {"weak": ["water", "rock", "ground"], "resist": ["fire", "grass", "ice", "bug", "steel", "fairy"], "immune": []},
    "water": {"weak": ["electric", "grass"], "resist": ["fire", "water", "ice", "steel"], "immune": []},
    "grass": {"weak": ["fire", "ice", "poison", "flying", "bug"], "resist": ["water", "electric", "grass"], "immune": []},
    "electric": {"weak": ["ground"], "resist": ["electric", "flying", "steel"], "immune": []},
    "ice": {"weak": ["fire", "fighting", "rock", "steel"], "resist": ["ice"], "immune": []},
    "fighting": {"weak": ["flying", "psychic", "fairy"], "resist": ["bug", "rock", "dark"], "immune": []},
    "poison": {"weak": ["ground", "psychic"], "resist": ["grass", "fighting", "poison", "bug", "fairy"], "immune": []},
    "ground": {"weak": ["water", "grass", "ice"], "resist": ["poison", "rock"], "immune": ["electric"]},
    "flying": {"weak": ["electric", "ice", "rock"], "resist": ["grass", "fighting", "bug"], "immune": ["ground"]},
    "psychic": {"weak": ["bug", "ghost", "dark"], "resist": ["fighting", "psychic"], "immune": []},
    "bug": {"weak": ["fire", "flying", "rock"], "resist": ["grass", "fighting", "ground"], "immune": []},
    "rock": {"weak": ["water", "grass", "fighting", "ground", "steel"], "resist": ["fire", "flying", "normal", "poison"], "immune": []},
    "ghost": {"weak": ["ghost", "dark"], "resist": ["poison", "bug"], "immune": ["normal", "fighting"]},
    "dragon": {"weak": ["ice", "dragon", "fairy"], "resist": ["fire", "water", "electric", "grass"], "immune": []},
    "dark": {"weak": ["fighting", "bug", "fairy"], "resist": ["ghost", "dark"], "immune": ["psychic"]},
    "steel": {"weak": ["fire", "fighting", "ground"], "resist": ["ice", "rock", "fairy", "flying", "psychic", "bug", "grass", "normal", "dragon", "steel"], "immune": ["poison"]},
    "fairy": {"weak": ["poison", "steel"], "resist": ["fighting", "bug", "dark"], "immune": ["dragon"]},
    "normal": {"weak": ["fighting"], "resist": [], "immune": ["ghost"]},
  };

  // Listas de fraquezas, resistências e imunidades
  Map<String, int> weaknesses = {for (var key in relations.keys) key: 0};
  for (var type in types) {
    type = type.toLowerCase();
    for (var weak in relations[type]!["weak"]) {
      weaknesses[weak] = weaknesses[weak]! - 1;
    }
    for (var resist in relations[type]!["resist"]) {
      weaknesses[resist] = weaknesses[resist]! + 1;
    }
    for (var immune in relations[type]!["immune"]) {
      weaknesses[immune] = double.infinity.toInt();
    }
  }

  // Classificando os resultados
  List<String> weak_2x = [], weak_4x = [], resist_2x = [], resist_4x = [], immune = [], neutral = [];
  weaknesses.forEach((type, value) {
    if (value == -2) {
      weak_4x.add(type);
    } else if (value == -1) {
      weak_2x.add(type);
    } else if (value == 1) {
      resist_2x.add(type);
    } else if (value == 2) {
      resist_4x.add(type);
    } else if (value == double.infinity.toInt()) {
      immune.add(type);
    } else {
      neutral.add(type);
    }
  });

  return {
    "weak_2x": weak_2x.isEmpty ? ["none"] : weak_2x,
    "weak_4x": weak_4x.isEmpty ? ["none"] : weak_4x,
    "resist_2x": resist_2x.isEmpty ? ["none"] : resist_2x,
    "resist_4x": resist_4x.isEmpty ? ["none"] : resist_4x,
    "immune": immune.isEmpty ? ["none"] : immune,
    "neutral": neutral.isEmpty ? ["none"] : neutral,
  };
}


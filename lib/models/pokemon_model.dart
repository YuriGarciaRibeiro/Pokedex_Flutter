// ignore_for_file: avoid_init_to_null



class Pokemon {
  int id;
  String name;
  String type;
  String type2;
  int total;
  int hp;
  int attack;
  int defense;
  int spAttack;
  int spDefense;
  int speed;
  String generation;
  String image;



  Pokemon({
     this.id = 0,
     this.name = '',
     this.type = '',
    this.type2 = '',
     this.total = 0,
     this.hp = 0,
     this.attack  = 0,
     this.defense = 0,
     this.spAttack = 0,
     this.spDefense = 0,
     this.speed = 0,
     this.generation = '',
     this.image = '',
  });

  static Pokemon fromJson(Map map) {
    return Pokemon(
      id: map['id'],
      name: map['name'],
      type: map['type'],
      type2: map['type2'],
      total: map['total'],
      hp: map['hp'],
      attack: map['attack'],
      defense: map['defense'],
      spAttack: map['spAttack'],
      spDefense: map['spDefense'],
      speed: map['speed'],
      generation: map['generation'],
      image: map['image'],
    );
  }
}

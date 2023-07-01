// ignore_for_file: avoid_init_to_null

import 'package:flutter/material.dart';

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
  bool legendary;
  Color color;
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
     this.legendary = false,
     this.color = Colors.white,
     this.image = '',
  });
}

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
    this.id,
    this.name,
    this.type,
    this.type2 = null,
    this.total,
    this.hp,
    this.attack,
    this.defense,
    this.spAttack,
    this.spDefense,
    this.speed,
    this.generation,
    this.legendary,
    this.color,
    this.image,
  });
}

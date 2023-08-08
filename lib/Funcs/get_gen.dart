int getGeneration(int pokemonNumber) {
  if (pokemonNumber >= 1 && pokemonNumber <= 151) {
    return 1; // Geração I
  } else if (pokemonNumber >= 152 && pokemonNumber <= 251) {
    return 2; // Geração II
  } else if (pokemonNumber >= 252 && pokemonNumber <= 386) {
    return 3; // Geração III
  } else if (pokemonNumber >= 387 && pokemonNumber <= 493) {
    return 4; // Geração IV
  } else if (pokemonNumber >= 494 && pokemonNumber <= 649) {
    return 5; // Geração V
  } else if (pokemonNumber >= 650 && pokemonNumber <= 721) {
    return 6; // Geração VI
  } else if (pokemonNumber >= 722 && pokemonNumber <= 809) {
    return 7; // Geração VII
  } else if (pokemonNumber >= 810 && pokemonNumber <= 898) {
    return 8; // Geração VIII
  } else if (pokemonNumber >= 899 && pokemonNumber <= 1010) {
    return 9; // Geração IX
  } else {
    return -1; // Número inválido
  }
}

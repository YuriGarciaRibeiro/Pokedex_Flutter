int getGeneration(int pokemonNumber) {
  if (pokemonNumber >= 1 && pokemonNumber <= 151) {
    return 1; // Gera��o I
  } else if (pokemonNumber >= 152 && pokemonNumber <= 251) {
    return 2; // Gera��o II
  } else if (pokemonNumber >= 252 && pokemonNumber <= 386) {
    return 3; // Gera��o III
  } else if (pokemonNumber >= 387 && pokemonNumber <= 493) {
    return 4; // Gera��o IV
  } else if (pokemonNumber >= 494 && pokemonNumber <= 649) {
    return 5; // Gera��o V
  } else if (pokemonNumber >= 650 && pokemonNumber <= 721) {
    return 6; // Gera��o VI
  } else if (pokemonNumber >= 722 && pokemonNumber <= 809) {
    return 7; // Gera��o VII
  } else if (pokemonNumber >= 810 && pokemonNumber <= 898) {
    return 8; // Gera��o VIII
  } else if (pokemonNumber >= 899 && pokemonNumber <= 1010) {
    return 9; // Gera��o IX
  } else {
    return -1; // N�mero inv�lido
  }
}

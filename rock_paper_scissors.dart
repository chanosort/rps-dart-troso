import 'dart:io';

//akoang main method
void main() {
    List<String> validMoves = ['rock', 'paper', 'scissors'];
    print("===ROCK, PAPER, SCISSORS===");

    String p1_name = getPlayerName(1);
    String p2_name = getPlayerName(2);

    int p1_Score = 0;
    int p2_Score = 0;
    int round = 1;
    String playAgain;
}

/// Asks for a player's name and returns it (falls back to a default if blank).
String getPlayerName (int p_number) {
  stdout.write('Enter player $p_number name: ');
  String input = (stdin.readLineSync() ?? '').trim();

  if (input.isEmpty) {
    String defaultName = 'Player $p_number';
    print('(No name entered. Using "$defaultName)".)');
    return defaultName;
  }
  return input;
}


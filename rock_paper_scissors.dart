import 'dart:io';
//main method
void main() {
  List<String> validMoves = ['rock', 'paper', 'scissors'];
  print("=== ROCK, PAPER, SCISSORS ===");

  String p1Name = getPlayerName(1);
  String p2Name = getPlayerName(2);

  int p1Score = 0;
  int p2Score = 0;
  int round = 1;
  String playAgain = '';

  do {
    print('--- Round $round ---');

    String player1Move = getMove(p1Name, validMoves);

    clearScreen();

    String player2Move = getMove(p2Name, validMoves);

    print('$p1Name chose $player1Move. $p2Name chose $player2Move.');

    String? winner = decideWinner(player1Move, player2Move);

    print(winner ?? "It's a draw!");

    if (winner == 'player1') {
      p1Score++;
    } else if (winner == 'player2') {
      p2Score++;
    }

    print('Score -> $p1Name: $p1Score | $p2Name: $p2Score');

    stdout.write('Play again? (y/n): ');
    playAgain = (stdin.readLineSync() ?? '').trim().toLowerCase();

    round++;
  } while (playAgain == 'y');

  print('===== FINAL SCORE =====');
  print('$p1Name: $p1Score | $p2Name: $p2Score');

  if (p1Score > p2Score) {
    print('Overall winner: $p1Name');
  } else if (p2Score > p1Score) {
    print('Overall winner: $p2Name');
  } else {
    print("Overall result: It's a draw!");
  }
}

/// Asks for a player's name and returns it, using a default when blank or null.
String getPlayerName(int playerNumber) {
  stdout.write('Enter player $playerNumber name: ');

  String? input = stdin.readLineSync();

  if (input == null || input.trim().isEmpty) {
    String defaultName = 'Player $playerNumber';
    print('(No name entered. Using "$defaultName".)');
    return defaultName;
  }
  return input.trim();
}

/// Repeatedly asks a player for a move.
String getMove(String playerName, List<String> validMoves) {
  String? move;

  do {
    stdout.write('$playerName, enter your move (rock/paper/scissors): ');
    String? raw = stdin.readLineSync();
    move = validateMove(raw, validMoves);

    if (move == null) {
      print('Invalid move. Please type rock, paper, or scissors.');
    }
  } while (move == null);

  return move;
}

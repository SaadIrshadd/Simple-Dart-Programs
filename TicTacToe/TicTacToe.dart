import 'dart:io';

void main() {
  print("\n===========================================");
  print("\t\tTicTacToe");
  print("===========================================\n");

  List<String> board = ['', '', '', '', '', '', '', '', ''];

  PrintBoard(board);
  Move(board);

}

//Method for printing the board
void PrintBoard(List<String> board) {
  for (var i = 0; i < 9; i++) {
    if (i == 3 || i == 6) {
      print("");
      print("----------------");
    }
    if (i == 2 || i == 5 || i == 8) {
      stdout.write("${board[i]==''?i+1:board[i]}");
    } else {
      stdout.write("${board[i] == '' ? i + 1 : board[i]}   |  ");

    }
  }
}

//Method for playing valid moves
void Move(List<String> board) {
  String player = "X";
  int validMoves=0;

  for (var i = 1; validMoves<9; i++) {
    print("");
    print("");
    stdout.write("${player} TURN: ");
    int? choice = int.parse(stdin.readLineSync()!);

    if (choice == "" || choice < 1 || choice > 9) {
      print("INVALID MOVE.");
    } 
    else {
      if (board[choice-1] == "X" || board[choice-1] == "O") {
        print("Place already occupied.");
      } 
      else {
        board[choice - 1] = player;
        validMoves++;
        if(WinCheck(board, player)){
          PrintBoard(board);
          print("\n\n\t\tPLAYER ${player} WINS!\n");
          return;
        }

        player = (player == "X") ? "O" : "X";
        
      }
    }
    print("");
    PrintBoard(board);
  }
    print("\n\nIt's a draw!");
}

bool WinCheck(List<String>board,String player) {
  List<List<int>> win = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];
  
  for (var win in win) {
    if(board[win[0]]==player&&board[win[1]]==player&&board[win[2]]==player){
      return true;
    }
  }
  return false;
}

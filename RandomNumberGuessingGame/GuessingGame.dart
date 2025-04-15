import "dart:async";
import "dart:io";
import 'dart:math';

void main() {
 
  print("===========================================");
  print("\tWELCOME TO THE GUESSING GAME");
  print("===========================================\n");

  print("IM SELECTING MY NUMBER FROM 0-100");
  
  Timer(Duration(seconds: 1), () {
    int secret = Random().nextInt(101); 
    print("I HAVE SELECTED MY NUMBER!\nSTART GUESSING.\n");
    
    GuessNum(secret);
  });
  
  

}

void GuessNum(secret){
  while(true){

    String? random=stdin.readLineSync();
    int num=int.parse(random!);

    if(num==secret){
      print("CORRECT! YOU GUESSED THE NUMBER");
      break;   
    }
    else if(num>secret){
      print("Too high! Guess Again.\n");
    }
    else if(num<secret){
      print("Too low! Guess Again.\n");
    }
    else{
      return;
    }
    
  }
}


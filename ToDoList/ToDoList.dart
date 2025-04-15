import 'dart:io';

void main() {
  
  List<String> todoList = [];
  print("\n\t\tTO-DO-LIST");
 
  while (true) {
    
    print("1.Add Task.");
    print("2.View Task.");
    print("3.Remove Task");
    print("4.Exit.\n");
    print("Enter your choice.");
 
    String? choice = stdin.readLineSync();
    print("");
    int ch = int.parse(choice!);
 
    if (ch == 1) {
      print("Enter task:");
      String? task = stdin.readLineSync();
      print("");
      if (task == null || task == "") {
        print("Task cannot be empty");
        print("");
      } 
      else {
        todoList.add(task);
        print("Task Added Succesfully");
        print("");
      }
    } 
    
    else if (ch == 2) {
      print("\t----Your Tasks----\n");
      if (todoList.isEmpty) {
        print("No tasks");
        print("");
      }
      else {
        for (var i = 0; i < todoList.length; i++) {
          print("${i + 1}.${todoList[i]}");
        }
        print("");
      }
    } 
    
    else if (ch == 3) {
      print("\t----Your Tasks----\n");      
      for (var i = 0; i < todoList.length; i++) {
        print("${i + 1}.${todoList[i]}");
      }
      print("");
      print("Enter task number you want to delete.");
    
      String? num = stdin.readLineSync();
      print("");
      int Num = int.parse(num!);
      
      if (Num > todoList.length) {
        print("Invalid task number!");
        print("");
      } 
      else {
        todoList.removeAt(Num-1);
        print("Task Removed!");
        print("");
      }
    } 
    
    else if (ch == 4) {
      break;
    } 
    
    else {
      print("Invalid Operation!");
      print("");   
    }
  }
}

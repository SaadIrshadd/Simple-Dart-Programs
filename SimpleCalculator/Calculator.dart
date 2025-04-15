import 'dart:io';

void main() {
  while (true) {
    print("\n============================");
    print("       SIMPLE CALCULATOR       ");
    print("============================");

    stdout.write("Enter first number: ");
    int num1 = int.parse(stdin.readLineSync()!);

    stdout.write("Enter second number: ");
    int num2 = int.parse(stdin.readLineSync()!);

    stdout.write("Enter operation (+, -, *, /): ");
    String? operation = stdin.readLineSync();

    switch (operation) {
      case "+":
        print("$num1 + $num2 = ${num1 + num2}");
        break;
      case "-":
        print("$num1 - $num2 = ${num1 - num2}");
        break;
      case "*":
        print("$num1 * $num2 = ${num1 * num2}");
        break;
      case "/":
        if (num2 != 0) {
          print("$num1 / $num2 = ${num1 ~/ num2}");
        } else {
          print("Error: Cannot divide by zero.");
        }
        break;
      default:
        print("Invalid Operation. Please enter +, -, *, or /");
        break;
    }

    print("============================\n");
  }
}

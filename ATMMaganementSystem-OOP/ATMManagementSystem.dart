import 'dart:io';

void main() {
 
  // Fixed accounts 
  Account saadAccount = Account('saad', 'saad123', 'Saad Irshad', 1000.0);
  Account hamzaAccount = Account('hamza', 'hamza123', 'Hamza Irshad', 5000.0);

  Account? currentAccount;

  while (true) {
    print('Welcome to the ATM');

    if (currentAccount == null) {
      stdout.write('Enter username: ');
      String? username = stdin.readLineSync()?.trim();

      stdout.write('Enter password: ');
      String? password = stdin.readLineSync()?.trim();

      if (username != null && password != null) {
        if (username == saadAccount.username && password == saadAccount.password) {
          currentAccount = saadAccount;
          print('\nLogin successful! Welcome Saad Irshad\n');
        } else if (username == hamzaAccount.username && password == hamzaAccount.password) {
          currentAccount = hamzaAccount;
          print('\nLogin successful! Welcome Hamza Irshad\n');
        } else {
          print('Invalid username or password.\n');
        }
      } else {
        print('Username or password cannot be empty.\n');
      }
    }

    if (currentAccount != null) {
      while (true) {
        print('1. Check Balance');
        print('2. Deposit');
        print('3. Withdraw');
        print('4. Log out');
        print('5. Exit');

        stdout.write('\nSelect: ');
        String? choice = stdin.readLineSync()?.trim();

        switch (choice) {
          case '1':
            currentAccount?.checkBalance();
            break;
          case '2':
            currentAccount?.deposit();
            break;
          case '3':
            currentAccount?.withdraw();
            break;
          case '4':
            currentAccount = null; // Log out by setting currentAccount to null
            print('\nLogged out successfully.\n');
            break; 
          case '5':
            print('\nExiting...\n');
            return; 
          default:
            print('\nInvalid choice. Try again.\n');
        }

        // Break the loop if user logs out
        if (currentAccount == null) {
          break;
        }
      }
    }
  }
}

class Account {
  String username;
  String password;
  String accountHolder;
  double balance;

  Account(this.username, this.password, this.accountHolder, this.balance);

  // Method to check balance
  void checkBalance() {
    print('\nYour current balance is: \$${balance}\n');
  }

  // Method to deposit money
  void deposit() {
    stdout.write('Enter amount to deposit: ');
    String? input = stdin.readLineSync();

    if (input != null) {
      double amount = double.tryParse(input.trim()) ?? 0.0;

      if (amount > 0) {
        balance += amount;
        print('\nAmount deposited: \$${amount}');
        print('Your new balance is: \$${balance}\n');
      } else {
        print('\nInvalid deposit amount\n');
      }
    }
  }

  // Method to withdraw money
  void withdraw() {
    stdout.write('Enter amount to withdraw: ');
    String? input = stdin.readLineSync();

    if (input != null) {
      double amount = double.tryParse(input.trim()) ?? 0.0;

      if (amount > 0 && amount <= balance) {
        balance -= amount;
        print('\nAmount withdrawn: \$${amount}');
        print('Your remaining balance is: \$${balance}\n');
      } else if (amount > balance) {
        print('\nInsufficient balance\n');
      } else {
        print('\nInvalid withdrawal amount\n');
      }
    }
  }
}

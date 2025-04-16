import 'dart:io';

void main() {
  stdout.write("Welcome to the Currency Converter!\n");

  stdout.write("Enter amount: ");
  double? amount = double.tryParse(stdin.readLineSync()!);
  stdout.write("\n");

  if (amount == null || amount <= 0) {
    stdout.write("Invalid amount entered.\n\n");
    return;
  }

  stdout.write("Choose currency to convert FROM:\n");
  stdout.write("1. USD (US Dollar)\n");
  stdout.write("2. EUR (Euro)\n");
  stdout.write("3. SAR (Saudi Riyal)\n");
  stdout.write("4. AED (UAE Dirham)\n");
  stdout.write("5. PKR (Pakistani Rupee)\n");
  stdout.write("Enter 1, 2, 3, 4, or 5: ");
  int from = int.parse(stdin.readLineSync()!);
  stdout.write("\n");

  stdout.write("Choose currency to convert TO:\n");
  stdout.write("1. USD (US Dollar)\n");
  stdout.write("2. EUR (Euro)\n");
  stdout.write("3. SAR (Saudi Riyal)\n");
  stdout.write("4. AED (UAE Dirham)\n");
  stdout.write("5. PKR (Pakistani Rupee)\n");
  stdout.write("Enter 1, 2, 3, 4, or 5: ");
  int to = int.parse(stdin.readLineSync()!);
  stdout.write("\n");

  double result = convert(amount, from, to);
  if (result != -1) {
    stdout.write("\nConverted Amount: $result\n\n");
  }
}

double convert(double amount, int from, int to) {
  const double usdToPkr = 280.0;
  const double usdToEur = 0.91;
  const double usdToSar = 3.75;
  const double usdToAed = 3.67;
  
  const double pkrToUsd = 1 / usdToPkr;
  const double eurToUsd = 1 / usdToEur;
  const double sarToUsd = 1 / usdToSar;
  const double aedToUsd = 1 / usdToAed;

  if (from == 1) {
    if (to == 1) {
      return amount; 
    } else if (to == 2) {
      return amount * usdToEur; 
    } else if (to == 3) {
      return amount * usdToSar; 
    } else if (to == 4) {
      return amount * usdToAed; 
    } else if (to == 5) {
      return amount * usdToPkr; 
    }
  }

  if (from == 2) {
    if (to == 1) {
      return amount * eurToUsd; 
    } else if (to == 2) {
      return amount; 
    } else if (to == 3) {
      return amount * eurToUsd * usdToSar; 
    } else if (to == 4) {
      return amount * eurToUsd * usdToAed; 
    } else if (to == 5) {
      return amount * eurToUsd * usdToPkr; 
    }
  }

  if (from == 3) {
    if (to == 1) {
      return amount * sarToUsd; 
    } else if (to == 2) {
      return amount * sarToUsd * usdToEur; 
    } else if (to == 3) {
      return amount; 
    } else if (to == 4) {
      return amount * sarToUsd * usdToAed; 
    } else if (to == 5) {
      return amount * sarToUsd * usdToPkr; 
    }
  }

  if (from == 4) {
    if (to == 1) {
      return amount * aedToUsd; 
    } else if (to == 2) {
      return amount * aedToUsd * usdToEur; 
    } else if (to == 3) {
      return amount * aedToUsd * usdToSar; 
    } else if (to == 4) {
      return amount; 
    } else if (to == 5) {
      return amount * aedToUsd * usdToPkr; 
    }
  }

  if (from == 5) {
    if (to == 1) {
      return amount * pkrToUsd; 
    } else if (to == 2) {
      return amount * pkrToUsd * usdToEur; 
    } else if (to == 3) {
      return amount * pkrToUsd * usdToSar; 
    } else if (to == 4) {
      return amount * pkrToUsd * usdToAed; 
    } else if (to == 5) {
      return amount; 
    }
  }

  stdout.write("Invalid currency option.\n\n");
  return -1;
}

import 'dart:io';

void main() {
  var app = System();

  while (true) {
    print('1. Add Student');
    print('2. View All Students');
    print('3. Search by Name');
    print('4. Delete by Student ID');
    print('5. Exit');

    stdout.write('\nSelect: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        app.addStudent();
        break;
      case '2':
        app.viewAll();
        break;
      case '3':
        app.searchByName();
        break;
      case '4':
        app.deleteByStudentId();
        break;
      case '5':
        return;
      default:
        print('\nInvalid choice\n');
    }
  }
}

class Person {
  String fullName;
  int age;

  // Constructor to initialize full name and age
  Person(this.fullName, this.age);
}

class Student extends Person {
  String studentId;

  // Constructor to initialize student info and call parent constructor
  Student(String fullName, int age, this.studentId) : super(fullName, age);

  // Method to display student info
  void displayInfo() {
    print('Name: $fullName');
    print('Age: $age');
    print('Student ID: $studentId\n');
  }
}

class System {
  List<Student> students = [];

  // Method to add a new student
  void addStudent() {
    stdout.write('Name: ');
    String? name = stdin.readLineSync();

    stdout.write('Age: ');
    int age = int.parse(stdin.readLineSync()!);

    stdout.write('Student ID: ');
    String? studentId = stdin.readLineSync();

    students.add(Student(name!, age, studentId!));
    print('\nStudent added\n');
  }

  // Method to view all students
  void viewAll() {
    if (students.isEmpty) {
      print('\nNo students found\n');
      return;
    }

    print('\n--- All Students ---\n');
    for (var s in students) {
      s.displayInfo();
    }
  }

  // Method to search student by name
  void searchByName() {
    stdout.write('Enter Name to search: ');
    String? name = stdin.readLineSync();

    var found = students.where((s) => s.fullName.toLowerCase() == name!.toLowerCase()).toList();

    if (found.isEmpty) {
      print('\nNo student found\n');
    } else {
      print('\n--- Search Result ---\n');
      for (var s in found) {
        s.displayInfo();
      }
    }
  }

  // Method to delete student by ID
  void deleteByStudentId() {
    stdout.write('Enter Student ID to delete: ');
    String? studentId = stdin.readLineSync();

    // Find student by ID
    var studentToDelete = students.where((s) => s.studentId == studentId).toList();

    if (studentToDelete.isNotEmpty) {
      students.remove(studentToDelete.first);  // Remove the first match
      print('\nStudent with ID $studentId has been deleted\n');
    } else {
      print('\nNo student found with this ID\n');
    }
  }
}

import 'dart:io';

import 'package:assignment_midterm/models/library.dart';

void main() {
  var library = Library();

  library.addBook("The Hobbit", "J.R.R. Tolkien", "Fantasy");
  library.addBook("Shaytanat", "Tohir Malik", "Criminal");
  library.addBook("Who will cry, when you die", "Robin Sharma", "Life lessons");

  while (true) {
    print("\nLibrary Management System");
    print("1. Display Catalog");
    print("2. Search Books");
    print("3. Sort Catalog");
    print("4. Add Book");
    print("5. Edit Book");
    print("6. Delete Book");
    print("7. Lend Book");
    print("8. Return Book");
    print("9. Display Summary");
    print("0. Exit");

    stdout.write("Enter your choice: ");
    var choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        library.displayCatalog();
        break;
      case 2:
        stdout.write("Enter search term: ");
        var searchTerm = stdin.readLineSync()!;
        library.searchBooks(searchTerm);
        break;
      case 3:
        library.sortCatalog();
        print("Catalog sorted alphabetically.");
        break;
      case 4:
        stdout.write("Enter title: ");
        var title = stdin.readLineSync()!;
        stdout.write("Enter author: ");
        var author = stdin.readLineSync()!;
        stdout.write("Enter genre: ");
        var genre = stdin.readLineSync()!;
        library.addBook(title, author, genre);
        print("$title added to the catalog.");
        break;
      case 5:
        library.displayCatalog();
        stdout.write("Enter index of the book to edit: ");
        var index = int.parse(stdin.readLineSync()!);
        stdout.write("Enter new title: ");
        var newTitle = stdin.readLineSync()!;
        stdout.write("Enter new author: ");
        var newAuthor = stdin.readLineSync()!;
        stdout.write("Enter new genre: ");
        var newGenre = stdin.readLineSync()!;
        library.editBook(index, newTitle, newAuthor, newGenre);
        print("Book edited successfully.");
        break;
      case 6:
        library.displayCatalog();
        stdout.write("Enter index of the book to delete: ");
        var index = int.parse(stdin.readLineSync()!);
        library.deleteBook(index);
        print("Book deleted from the catalog.");
        break;
      case 7:
        library.displayCatalog();
        stdout.write("Enter index of the book to lend: ");
        var bookIndex = int.parse(stdin.readLineSync()!);
        stdout.write("Enter borrower's name: ");
        var borrower = stdin.readLineSync()!;
        print("Enter due date (yyyy-mm-dd): ");
        var dueDate = DateTime.parse(stdin.readLineSync()!);
        library.lendBook(bookIndex, borrower, dueDate);
        break;
      case 8:
        library.displayCatalog();
        stdout.write("Enter index of the book to return: ");
        var bookIndex = int.parse(stdin.readLineSync()!);
        library.returnBook(bookIndex);
        break;
      case 9:
        library.displaySummary();
        break;
      case 0:
        print("Exiting the Library Management System. Goodbye!");
        return;
      default:
        print("Invalid choice. Please enter a number between 0 and 9.");
    }
  }
}


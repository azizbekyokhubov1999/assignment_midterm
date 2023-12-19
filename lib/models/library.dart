import 'book.dart';

class Library {
  List<Book> catalog = [];
  List<Map<String, dynamic>> lendingRecords = [];

  void addBook(String title, String author, String genre) {
    catalog.add(Book(title, author, genre, true));
  }

  void editBook(int index, String title, String author, String genre) {
    catalog[index] = Book(title, author, genre, catalog[index].isAvailable);
  }

  void deleteBook(int index) {
    catalog.removeAt(index);
  }

  void displayCatalog() {
    print("Catalog:");
    for (var i = 0; i < catalog.length; i++) {
      print("$i: ${catalog[i].title} by ${catalog[i].author} (${catalog[i].genre})");
    }
  }

  void searchBooks(String searchTerm) {
    var searchResults = catalog.where((book) =>
    book.title.toLowerCase().contains(searchTerm.toLowerCase()) ||
        book.author.toLowerCase().contains(searchTerm.toLowerCase()) ||
        book.genre.toLowerCase().contains(searchTerm.toLowerCase()));

    print("Search Results:");
    for (var book in searchResults) {
      print("${book.title} by ${book.author} (${book.genre})");
    }
  }

  void sortCatalog() {
    catalog.sort((a, b) => a.title.compareTo(b.title));
  }

  void lendBook(int bookIndex, String borrower, DateTime dueDate) {
    if (catalog[bookIndex].isAvailable) {
      catalog[bookIndex].isAvailable = false;
      lendingRecords.add({
        'title': catalog[bookIndex].title,
        'borrower': borrower,
        'dueDate': dueDate,
      });
      print("${catalog[bookIndex].title} has been lent to $borrower.");
    } else {
      print("Sorry, ${catalog[bookIndex].title} is already lent out.");
    }
  }

  void returnBook(int bookIndex) {
    catalog[bookIndex].isAvailable = true;
    print("${catalog[bookIndex].title} has been returned.");

  }

  void displaySummary() {
    print("Library Summary:");
    print("Total Books: ${catalog.length}");
    print("Books Lent Out: ${catalog.where((book) => !book.isAvailable).length}");
    print("Lending Records: ${lendingRecords.length}");
  }
}
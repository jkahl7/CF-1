//
//  cfLib1.swift
//  
//
//  Created by Josh Kahl on 12/8/14.
//
//
/*****************************************************************************************
**    create a  Library, Shelf, and Book objects and have them interact
    The library should be aware of a number of shelves. Each shelf should know what books it contains. Make the book object have "enshelf" and "unshelf" methods that control what shelf the book is sitting on. The library should have a method to report all books it contains.
*****************************************************************************************/

// Playground - noun: a place where people can play
import Foundation

class Book {
    var name:String = ""
    var bookloc:Int = 0
    
    func unShelf(shelfName: Shelf) {
        if shelfName.BooksOnShelf > 2 && ((shelfName.BooksOnShelf) - 1) != bookloc {  // shuffels books on shelf so booloc won't overlap
            shelfName.indvShelf.removeAtIndex(bookloc)
            var temp:Book = shelfName.indvShelf.removeLast()
            shelfName.indvShelf.insert(temp, atIndex: bookloc)
            temp.bookloc = bookloc
        } else {
            shelfName.indvShelf.removeAtIndex(bookloc)
        }
    }
    func enShelf(shelfName: Shelf, bookID: Book) {
        if shelfName.BooksOnShelf > 1 {
            shelfName.indvShelf.append(bookID)
            bookID.bookloc = shelfName.BooksOnShelf - 1
        } else {
            shelfName.indvShelf.append(bookID)
            bookID.bookloc = shelfName.BooksOnShelf
        }
    }
}

class Shelf {
    var indvShelf:[Book] = []
    init(){
        self.indvShelf = []
    }
    var BooksOnShelf = 0
    
    func AddBookToShelf(bookID: Book) {
        self.indvShelf.append(bookID)
        BooksOnShelf = indvShelf.count
        bookID.bookloc = BooksOnShelf - 1
        println("New Book created")
    }
}

class Library {
    var Shelves:[Shelf] = []
    var BookTotal = 0
    init() {
        self.Shelves = []
    }
    
    func AddShelfToLib(shelfID: Shelf) {
        self.Shelves.append(shelfID)
        println("New shelf created")
    }
    
    func bookReport() {
        for ishelf in Shelves {
            BookTotal += ishelf.BooksOnShelf
        }
        println("There are \(BookTotal) books in the Library")
    }
}







/* test values
var book1 = Book()
book1.name = "I hope this works"

var book2 = Book()
book2.name = "This too"

var book3 = Book()
book3.name = "one more"

var book4 = Book()
book4.name = "for another shelf"

var a = Shelf()
var b = Shelf()

var myLib = Library()
myLib.AddShelfToLib(a)
myLib.AddShelfToLib(b)

a.AddBookToShelf(book1)
a.AddBookToShelf(book2)
a.AddBookToShelf(book3)
b.AddBookToShelf(book4)

a.indvShelf

book1.unShelf(a)

a.indvShelf

book1.enShelf(a, bookID: book1)

a.indvShelf

b.indvShelf

book1.unShelf(a)
book1.enShelf(b, bookID: book1)

b.indvShelf
a.indvShelf

*/
































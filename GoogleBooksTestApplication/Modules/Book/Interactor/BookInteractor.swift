//
//  BookInteractor.swift
//  GoogleBooksTestApplication
//
//  Created by Asmins on 03/03/2017.
//  Copyright © 2017 GoogleBooksTestApp. All rights reserved.
//
import RealmSwift
import SwiftyJSON
// MARK: - BookInteractor

final class BookInteractor {

    // MARK: - VIPER stack

    var bookService = BookService()
    var parserService = Parser()
    weak var presenter: BookInteractorOutput!

    // MARK: -

}

// MARK: - BookInteractorInput

extension BookInteractor: BookInteractorInput {
    func getBook(_ bookName: String) {

        bookService.regues(bookName: bookName, result: {error, result in
            if error == nil {
                if result != nil {
                    self.parserService.parseJson(result!)
                }
            }
        })
    }

    func getBookFromBD(){
        var books = [Book]()
        DispatchQueue.main.async {
            let realm = try! Realm()
            let bookModels = realm.objects(BookModels.self)
            for book in bookModels {
                let book = Book(title: book.value(forKey: "title")! as! String,
                                authors: book.value(forKey: "authors")! as! String,
                                urlForImage: book.value(forKey: "urlForImage")! as! String,
                                description: book.value(forKey: "descriptionBook")! as! String)
                books.append(book)
            }
           self.presenter.setupBookFromBD(books)
        }
    }

}


extension BookInteractor: ParserPassBook {
    func passBook(_ book: [Book]) {
        presenter.setupBook(books: book)
    }
}

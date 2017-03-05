//
//  Parser.swift
//  GoogleBooksTestApplication
//
//  Created by Asmins on 05.03.17.
//  Copyright © 2017 Asmins. All rights reserved.
//
import Alamofire
import SwiftyJSON
import Foundation

protocol ParserPassBook {
    func passBook(_ book: [Book])
}

class Parser {

    fileprivate var books = [Book]()

    var delegate: ParserPassBook!

    func parseJson(_ json: JSON) {
        books.removeAll()
        let items = json["items"]
        if items.count != 0 {
            for i in 0...items.count - 1 {
                var authors: String!

                let volumeInfo = items[i]["volumeInfo"]
                let imageLinks = items[i]["volumeInfo"]["imageLinks"]
                let authorCon = volumeInfo["authors"]

                let imageLink = imageLinks["thumbnail"].stringValue
                let title = volumeInfo["title"].stringValue
                let description = volumeInfo["description"].stringValue

                if authorCon != nil {
                    for author in volumeInfo["authors"] {
                        authors = author.1.stringValue
                    }
                } else {
                    authors = "We don`t know"
                }

                books.append(Book(title: title, authors: authors, urlForImage: imageLink, description: description))
                
            }
        }
        delegate.passBook(books)
    }
}

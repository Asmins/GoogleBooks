//
//  Book.swift
//  GoogleBooksTestApplication
//
//  Created by Asmins on 04.03.17.
//  Copyright © 2017 Asmins. All rights reserved.
//
import RealmSwift
import Foundation

struct Book {
    let title: String
    let authors: String
    let urlForImage: String
    let description: String
}

class BookModels: Object {
    dynamic var title = ""
    dynamic var authors = ""
    dynamic var urlForImage = ""
    dynamic var descriptionBook = ""
 }

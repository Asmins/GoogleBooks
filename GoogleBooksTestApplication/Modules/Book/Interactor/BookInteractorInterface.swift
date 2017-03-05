//
//  BookInteractorInterface.swift
//  GoogleBooksTestApplication
//
//  Created by Asmins on 03/03/2017.
//  Copyright © 2017 GoogleBooksTestApp. All rights reserved.
//

// MARK: - BookInteractorInput

protocol BookInteractorInput: class {
    func getBook(_ bookName: String)
    func getBookFromBD()
}

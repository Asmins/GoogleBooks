//
//  MoreDetailInteractor.swift
//  GoogleBooksTestApplication
//
//  Created by Asmins on 05/03/2017.
//  Copyright © 2017 GoogleBooksTestApp. All rights reserved.
//
import RealmSwift
// MARK: - MoreDetailInteractor

final class MoreDetailInteractor {

    // MARK: - VIPER stack

    weak var presenter: MoreDetailInteractorOutput!
    let realm = try! Realm()
    // MARK: -

}

// MARK: - MoreDetailInteractorInput

extension MoreDetailInteractor: MoreDetailInteractorInput {
    func saveInBD(_ book: Book) {
        let bookModel = BookModels()
        
        bookModel.title = book.title
        bookModel.authors = book.authors
        bookModel.descriptionBook = book.description
        bookModel.urlForImage = book.urlForImage

        try! realm.write {

            realm.add(bookModel)

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
                self.presenter.dissmiss()
            })
        }
    }
}

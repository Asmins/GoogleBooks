//
//  BookPresenterInterface.swift
//  GoogleBooksTestApplication
//
//  Created by Asmins on 03/03/2017.
//  Copyright © 2017 GoogleBooksTestApp. All rights reserved.
//

import Chamomile

// MARK: - BookViewOutput

protocol BookViewOutput: class {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath, selectionScreen: Int)
    func openBasketScreen(_ book: Book, selectionScreen: Int)
    func removeAllBook()
    func getBookFromBD()
    func getBook(_ bookName: String)
}

// MARK: - BookInteractorOutput

protocol BookInteractorOutput: class {
    func setupBook(books: [Book])
    func setupBookFromBD(_ books: [Book])
}

// MARK: - BookModuleInput

protocol BookModuleInput: ModuleInput {

}

// MARK: - BookModuleOutput

protocol BookModuleOutput: ModuleOutput {

}

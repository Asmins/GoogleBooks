//
//  BookPresenter.swift
//  GoogleBooksTestApplication
//
//  Created by Asmins on 03/03/2017.
//  Copyright © 2017 GoogleBooksTestApp. All rights reserved.
//

import Chamomile

// MARK: - BookPresenter

final class BookPresenter {

    // MARK: - VIPER stack

    weak var moduleOutput: ModuleOutput?
    weak var view: BookViewInput!
    var interactor: BookInteractorInput!
    var router: BookRouterInput!

    var books = [Book]()
    var numberOfScreen = 0 

}

// MARK: - BookViewOutput

extension BookPresenter: BookViewOutput {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookTableViewCell") as! BookTableViewCell
        cell.setupCell(books[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if books.count == 0 {
            tableView.isScrollEnabled = false
        } else {
            tableView.isScrollEnabled = true
        }
        return books.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath, selectionScreen: Int) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.openBasketScreen(self.books[indexPath.row], selectionScreen: selectionScreen)
    }
    
    func getBook(_ bookName: String) {
        interactor.getBook(bookName)
    }

    func getBookFromBD() {
        interactor.getBookFromBD()
    }

    func removeAllBook() {
        books.removeAll()
        self.view.reloadData()
    }

    func openBasketScreen(_ book: Book, selectionScreen: Int) {
        router.openMoreDetailScreen(book: book, selectionScreen: selectionScreen, moduleOutput: self)
    }

}

// MARK: - BookInteractorOutput

extension BookPresenter: BookInteractorOutput {
    func setupBook(books: [Book]) {
        self.books.removeAll()
        self.books = books
        self.view.reloadData()
    }

    func setupBookFromBD(_ books: [Book]) {
        self.books.removeAll()
        self.books = books
        self.view.reloadData()
    }
}

// MARK: - BookModuleInput

extension BookPresenter: BookModuleInput {

}

extension BookPresenter: MoreDetailModuleOutput {

}


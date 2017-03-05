//
//  MoreDetailPresenter.swift
//  GoogleBooksTestApplication
//
//  Created by Asmins on 05/03/2017.
//  Copyright © 2017 GoogleBooksTestApp. All rights reserved.
//
import SDWebImage
import Chamomile

// MARK: - MoreDetailPresenter

final class MoreDetailPresenter {

    // MARK: - VIPER stack

    weak var moduleOutput: ModuleOutput?
    weak var view: MoreDetailViewInput!
    var interactor: MoreDetailInteractorInput!
    var router: MoreDetailRouterInput!

    var book: Book!
    var selectionScreen: Int!
}

// MARK: - MoreDetailViewOutput

extension MoreDetailPresenter: MoreDetailViewOutput {
    func dissmissView() {
        router.dissmisView()
    }

    func saveInBD() {
        interactor.saveInBD(book)
    }

    func setupView(imageView: UIImageView, titleLabel: UILabel, desriptonView: UITextView, authorBook: UILabel) {
        let url = URL(string: book.urlForImage)
        imageView.sd_setImage(with: url)
        titleLabel.text = book.title
        authorBook.text = book.authors
        if book.description == "" {
            desriptonView.text = "In this place must was some description but we have not description for this book"
        } else {
            desriptonView.text = book.description
        }
    }

    func showOrHiddenButton(_ buttom: UIButton) {
        if selectionScreen == 0 {
            buttom.isHidden = false
        } else {
            buttom.isHidden = true
        }
    }

}

// MARK: - MoreDetailInteractorOutput

extension MoreDetailPresenter: MoreDetailInteractorOutput {
    func dissmiss() {
        router.dissmisView()
    }
}

// MARK: - MoreDetailModuleInput

extension MoreDetailPresenter: MoreDetailModuleInput {
    func setupBook(_ book: Book,selectionScreen: Int) {
        self.book = book
        self.selectionScreen = selectionScreen
    }
}

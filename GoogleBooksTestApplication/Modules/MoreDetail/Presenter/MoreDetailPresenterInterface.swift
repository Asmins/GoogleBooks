//
//  MoreDetailPresenterInterface.swift
//  GoogleBooksTestApplication
//
//  Created by Asmins on 05/03/2017.
//  Copyright © 2017 GoogleBooksTestApp. All rights reserved.
//
import UIKit
import Chamomile

// MARK: - MoreDetailViewOutput

protocol MoreDetailViewOutput: class {
    func setupView(imageView: UIImageView, titleLabel: UILabel, desriptonView: UITextView, authorBook: UILabel)
    func saveInBD() 
    func dissmissView()
    func showOrHiddenButton(_ buttom: UIButton)
}

// MARK: - MoreDetailInteractorOutput

protocol MoreDetailInteractorOutput: class {
    func dissmiss()
}

// MARK: - MoreDetailModuleInput

protocol MoreDetailModuleInput: ModuleInput {
    func setupBook(_ book: Book, selectionScreen: Int)
}

// MARK: - MoreDetailModuleOutput

protocol MoreDetailModuleOutput: ModuleOutput {

}

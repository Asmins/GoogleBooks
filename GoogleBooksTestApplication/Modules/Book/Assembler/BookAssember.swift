//
//  BookAssember.swift
//  GoogleBooksTestApplication
//
//  Created by Asmins on 03/03/2017.
//  Copyright © 2017 GoogleBooksTestApp. All rights reserved.
//

import Foundation

// MARK: - BookAssembler

final class BookAssembler: NSObject {

    @IBOutlet weak var view: BookViewController!

    override func awakeFromNib() {
        super.awakeFromNib()

        let interactor = BookInteractor()
        let presenter = BookPresenter()
        let router = BookRouter()

        view.presenter = presenter
        view.moduleInput = presenter
        interactor.parserService.delegate = interactor
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        router.flowController = view
    }

}

//
//  MoreDetailAssember.swift
//  GoogleBooksTestApplication
//
//  Created by Asmins on 05/03/2017.
//  Copyright © 2017 GoogleBooksTestApp. All rights reserved.
//

import Foundation

// MARK: - MoreDetailAssembler

final class MoreDetailAssembler: NSObject {

    @IBOutlet weak var view: MoreDetailViewController!

    override func awakeFromNib() {
        super.awakeFromNib()

        let interactor = MoreDetailInteractor()
        let presenter = MoreDetailPresenter()
        let router = MoreDetailRouter()

        view.presenter = presenter
        view.moduleInput = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        router.flowController = view
    }

}

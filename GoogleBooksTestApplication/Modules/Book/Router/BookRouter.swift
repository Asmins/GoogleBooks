//
//  BookRouter.swift
//  GoogleBooksTestApplication
//
//  Created by Asmins on 03/03/2017.
//  Copyright © 2017 GoogleBooksTestApp. All rights reserved.
//
import Perform
import Chamomile

// MARK: - BookRouter

final class BookRouter {

    // MARK: - VIPER stack

    weak var flowController: FlowController!

}

// MARK: - BookRouterInput

extension BookRouter: BookRouterInput {
    func openMoreDetailScreen(book: Book,selectionScreen: Int, moduleOutput: MoreDetailModuleOutput) {
        flowController.openModule(using: .openMoreDetail, completion: {
            guard let moduleInput = $0 as? MoreDetailModuleInput else { fatalError() }
            moduleInput.setupBook(book, selectionScreen: selectionScreen)
            return moduleOutput
        })
    }
}

extension Segue {
     static var openMoreDetail: Segue<MoreDetailViewController> {
        return .init(identifier: SegueIndentifier().moreScreen)
    }
}

//
//  BookRouterInterface.swift
//  GoogleBooksTestApplication
//
//  Created by Asmins on 03/03/2017.
//  Copyright © 2017 GoogleBooksTestApp. All rights reserved.
//

// MARK: - BookRouterInput

protocol BookRouterInput: class {
    func openMoreDetailScreen(book: Book,selectionScreen: Int, moduleOutput: MoreDetailModuleOutput)
}

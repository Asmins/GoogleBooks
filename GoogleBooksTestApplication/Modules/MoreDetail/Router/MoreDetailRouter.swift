//
//  MoreDetailRouter.swift
//  GoogleBooksTestApplication
//
//  Created by Asmins on 05/03/2017.
//  Copyright © 2017 GoogleBooksTestApp. All rights reserved.
//

import Chamomile

// MARK: - MoreDetailRouter

final class MoreDetailRouter {

    // MARK: - VIPER stack

    weak var flowController: FlowController!

}

// MARK: - MoreDetailRouterInput

extension MoreDetailRouter: MoreDetailRouterInput {
    func dissmisView() {
        flowController.closeModule(animated: true)
    }
}

//
//  MoreDetailViewController.swift
//  GoogleBooksTestApplication
//
//  Created by Asmins on 05/03/2017.
//  Copyright © 2017 GoogleBooksTestApp. All rights reserved.
//

import Chamomile

// MARK: - MoreDetailViewController

final class MoreDetailViewController: UIViewController, FlowController {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var topTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var desriptionView: UITextView!
    @IBOutlet weak var authorBook: UILabel!
    @IBOutlet weak var titleBook: UILabel!
    @IBOutlet weak var imageViewBook: UIImageView!
    // MARK: - VIPER stack

    var presenter: MoreDetailViewOutput!


    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setupView(imageView: imageViewBook,
                            titleLabel: titleBook,
                            desriptonView: desriptionView,
                            authorBook: authorBook)
        presenter.showOrHiddenButton(addButton)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    @IBAction func backTap(_ sender: Any) {
        presenter.dissmissView()
    }

    @IBAction func addTapInBasket(_ sender: Any) {
        presenter.saveInBD()
    }

}

// MARK: - MoreDetailViewInput

extension MoreDetailViewController: MoreDetailViewInput {

}

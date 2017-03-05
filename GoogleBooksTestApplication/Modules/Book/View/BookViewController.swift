//
//  BookViewController.swift
//  GoogleBooksTestApplication
// //  Created by Asmins on 03/03/2017.
//  Copyright © 2017 GoogleBooksTestApp. All rights reserved.
//
import Chamomile

// MARK: - BookViewController

final class BookViewController: UIViewController, FlowController {

    @IBOutlet weak var basketButton: UIButton!
    @IBOutlet weak var bookButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    // MARK: - VIPER stack
   
    var presenter: BookViewOutput!
    var numberSelectionScreen: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.numberSelectionScreen = 0
        self.setupSearchBar()
        self.setupTableView(tableView)
        self.navigationController?.setupTitle("BOOKS")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.numberSelectionScreen == 0 {
            self.bookButton.isSelected = true
            self.basketButton.isSelected = false
        } else {
            self.bookButton.isSelected = false
            self.basketButton.isSelected = true
        }
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    @IBAction func basketTap(_ sender: Any) {
        presenter.removeAllBook()
        numberSelectionScreen = 1
        self.bookButton.isSelected = false
        self.basketButton.isSelected = true
        presenter.getBookFromBD() 
    }

    @IBAction func bookTap(_ sender: Any) {
        presenter.removeAllBook()
        numberSelectionScreen = 0
        self.bookButton.isSelected = true
        self.basketButton.isSelected = false
    }
}

extension BookViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return presenter.tableView(tableView, cellForRowAt: indexPath)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.tableView(tableView, numberOfRowsInSection: section)
    }
}

extension BookViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.tableView(tableView, didSelectRowAt: indexPath, selectionScreen: self.numberSelectionScreen)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
}

extension BookViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.characters.count >= 2 {
            presenter.getBook(searchText)
        } else {
            presenter.removeAllBook()
        }
    }
}

// MARK: - BookViewInput

extension BookViewController: BookViewInput {
    func setupTableView(_ tableView: UITableView) {
        tableView.register(UINib(nibName: "BookTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "bookTableViewCell")
    }

    func reloadData() {
        tableView.reloadData()
    }

    func setupSearchBar() {
        searchBar.placeholder = "Search any books"
        searchBar.barTintColor = UIColor(red: 83/255, green: 214/255, blue: 59/255, alpha: 1)
    }
}

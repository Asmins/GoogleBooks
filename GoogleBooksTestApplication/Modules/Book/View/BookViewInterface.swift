//
//  BookViewInterface.swift
//  GoogleBooksTestApplication
//
//  Created by Asmins on 03/03/2017.
//  Copyright © 2017 GoogleBooksTestApp. All rights reserved.
//
import UIKit
// MARK: - BookViewInput

protocol BookViewInput: class {
    func setupSearchBar()
    func reloadData()
    func setupTableView(_ tableView: UITableView)
}

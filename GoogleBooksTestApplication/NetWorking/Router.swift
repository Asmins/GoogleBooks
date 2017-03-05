//
//  Router.swift
//  GoogleBooksTestApplication
//
//  Created by Asmins on 03.03.17.
//  Copyright © 2017 Asmins. All rights reserved.
//
import Alamofire
import Foundation

enum Router {
    case getBook(text: String)

    static let baseURL = "https://www.googleapis.com/books/v1/volumes?"

    var httpMethod: Alamofire.HTTPMethod {
        switch self {
        case .getBook(text: _):
            return .get
        }
    }

    var path: String {
        switch self {
        case .getBook(text: let text):
            return "q=\(text)&printType=books&key=AIzaSyAbzija2pGt3Vq_Pmy-kIWaGuXCmmnFRXY"
        }
    }

    var url: URL {
        let url = "\(Router.baseURL)\(self.path)" as String
        let urlStr  = url.addingPercentEscapes(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))! as String
        let searchURL : URL = URL(string: urlStr as String)!
        return searchURL as URL
    }
}

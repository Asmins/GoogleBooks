//
//  BookService.swift
//  GoogleBooksTestApplication
//
//  Created by Asmins on 03.03.17.
//  Copyright © 2017 Asmins. All rights reserved.
//
import UIKit
import Foundation
import Alamofire
import SwiftyJSON

class BookService {
    fileprivate let manager: ApiManagerProtocol

    init(manager: ApiManagerProtocol = SessionManager.default) {
        self.manager = manager
    }

    func regues(bookName: String, result: @escaping (_ error: Error?, _ result: JSON?) -> ()) {
        let _ = manager.apiRequest(.getBook(text: bookName), parameters: nil, headers: nil).apiResponse { response in
            switch response.result {
            case .success(let json):
                return result(nil, json)
            case .failure(let error):
                return result(error, nil)
            }
        }
    }

}

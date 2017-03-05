//
//  CustomNavController.swift
//  GoogleBooksTestApplication
//
//  Created by Asmins on 04.03.17.
//  Copyright © 2017 Asmins. All rights reserved.
//

import UIKit

class CustomNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        changeColor()
        // Do any additional setup after loading the view.
    }

    func changeColor() {
        self.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "AvenirNext-MediumItalic", size: 20)!,NSForegroundColorAttributeName: UIColor.white]
        self.navigationBar.barTintColor = UIColor(red: 83/255, green: 214/255, blue: 59/255, alpha: 1)
    }

}

extension UINavigationController {
    func setupTitle(_ text: String) {
        navigationBar.topItem?.title = text
    }
}

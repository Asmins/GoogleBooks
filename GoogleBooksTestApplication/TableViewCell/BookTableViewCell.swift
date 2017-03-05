//
//  BookTableViewCell.swift
//  GoogleBooksTestApplication
//
//  Created by Asmins on 05.03.17.
//  Copyright © 2017 Asmins. All rights reserved.
//
import SDWebImage
import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var imageBook: UIImageView!
    @IBOutlet weak var titleBook: UILabel!
    @IBOutlet weak var authorBook: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupCell(_ book: Book) {
        titleBook.text = book.title
        authorBook.text = book.authors
        let imageURL = URL(string: book.urlForImage)
        imageBook.sd_setImage(with: imageURL)
    }

}

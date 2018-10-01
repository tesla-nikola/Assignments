//
//  ArticleListViewCell.swift
//  ViperTest
//
//  Created by User-81-Mac on 01/10/18.
//  Copyright © 2018 User-81-Mac. All rights reserved.
//

import UIKit

class ArticleListViewCell: UITableViewCell {
	@IBOutlet weak var featuredImage: UIImageView!
	@IBOutlet weak var titleLbl: UILabel!
	@IBOutlet weak var authorsLbl: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	func fillWithData(article: Datum) {
		if article.featuredImage.count > 0 {
			featuredImage.imageFromServerURL(article.featuredImage.first!.imageFile, placeHolder: nil)
		} else {
			//no image
		}
		titleLbl.text = article.title
		
		if article.authors.count > 0 {
			var authorString = ""
			article.authors.forEach({authorString +=  $0.fullName + "∙"})
			authorsLbl.text = String(authorString.dropLast())
		} else {
			// no authors
			authorsLbl.text = ""
		}
	}

}

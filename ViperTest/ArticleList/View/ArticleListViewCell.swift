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
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var enclosedView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        enclosedView.layer.cornerRadius = 5.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	override func prepareForReuse() {
        featuredImage.image = UIImage(named: "placeholder")
	}
	
	func fillWithData(article: Datum) {
        if article.featuredImage.count > 0 {
            featuredImage.imageFromServerURL(article.featuredImage.first!.imageFile, placeHolder: UIImage(named: "placeholder"))
        } else {
            //no image
            featuredImage.image = UIImage(named: "placeholder")
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
        dateLbl.text = dateToString(date: article.publishDate)
        
	}
    
    func dateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from:date)
    }

}

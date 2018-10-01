//
//  UIImage.swift
//  ViperTest
//
//  Created by User-81-Mac on 01/10/18.
//  Copyright © 2018 User-81-Mac. All rights reserved.
//

import UIKit


let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
	
	func imageFromServerURL(_ URLString: String, placeHolder: UIImage?) {
		
		self.image = nil
		if let cachedImage = imageCache.object(forKey: NSString(string: URLString)) {
			self.image = cachedImage
			return
		}
		
		if let url = URL(string: URLString) {
			URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
				
				//print("RESPONSE FROM API: \(response)")
				if error != nil {
					print("ERROR LOADING IMAGES FROM URL: \(error)")
					DispatchQueue.main.async {
						self.image = placeHolder
					}
					return
				}
				DispatchQueue.main.async {
					if let data = data {
						if let downloadedImage = UIImage(data: data) {
							imageCache.setObject(downloadedImage, forKey: NSString(string: URLString))
							self.image = downloadedImage
						}
					}
				}
			}).resume()
		}
	}
}

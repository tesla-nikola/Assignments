//
//  ArticlesListView.swift
//  ViperTest
//
//  Created User-81-Mac on 01/10/18.
//  Copyright © 2018 User-81-Mac. All rights reserved.
//
//

import UIKit

class ArticlesListView: UIViewController, ArticlesListViewProtocol {
	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
	@IBOutlet weak var tableView: UITableView!
	
	var presenter: ArticlesListPresenterProtocol?
	var data: [Datum] = []
    // MARK: - View Life Cycle Methods
	override func viewDidLoad() {
        super.viewDidLoad()
		tableView.estimatedRowHeight = 140.0
		loadArticles()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
	
	func loadArticles() {
		presenter?.loadArticleDataFromServer()
	}
	
	func startActivityIndicator() {
		activityIndicator.startAnimating()
	}
	
	func stopActivityIndicator() {
		activityIndicator.stopAnimating()
	}
	
	func reloadData(data: ArticleFeedResponse) {
		self.data = data.data
		tableView.reloadData()
	}
}


extension ArticlesListView : UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return data.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleListViewCell") as! ArticleListViewCell
		cell.fillWithData(article: data[indexPath.row])
		return cell
	}
}

extension ArticlesListView: UITableViewDelegate {
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableView.automaticDimension
	}
}

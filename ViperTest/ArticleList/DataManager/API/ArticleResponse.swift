//
//  ArticleResponse.swift
//  ViperTest
//
//  Created by User-81-Mac on 01/10/18.
//  Copyright © 2018 User-81-Mac. All rights reserved.
//

import Foundation


struct ArticleFeedResponse: Codable {
	let count, totalCount, pageSize, totalPages: Int
	let next: String
	let previous: Int?
	let currentPage: Int
	let metadata: Metadata
	let message: String
	let data: [Datum]
	
	enum CodingKeys: String, CodingKey {
		case count
		case totalCount = "total_count"
		case pageSize = "page_size"
		case totalPages = "total_pages"
		case next, previous
		case currentPage = "current_page"
		case metadata, message
		case data
	}
}

struct Datum: Codable {
	let title, slug: String
	let status: Int
	let contentCode: String?
	let authors: [Author]
	let approvers: [Int]
	let description: String
	let videoContent: String?
	let articleTypeFk: ArticleTypeFk
	let featuredArticle: Bool
	let featuredImage: [FeaturedImage]
	let publishDate: Date
	let publishDateReadable, createdReadable: String
	let regionList: [RegionList]
	let tagList: [TagList]
	let reportSlug: String?
	let getArticleTypeDisplay: ArticleTypeFk
	let getStatusDisplay: GetStatusDisplay
	let subscriptionPackage: [SubscriptionPackage]
	
	enum CodingKeys: String, CodingKey {
		case title
		case slug
		case status
		case contentCode = "content_code"
		case authors
		case approvers
		case description
		case videoContent = "video_content"
		case articleTypeFk = "article_type_fk"
		case featuredArticle = "featured_article"
		case featuredImage = "featured_image"
		case publishDate = "publish_date"
		case publishDateReadable = "publish_date_readable"
		case createdReadable = "created_readable"
		case regionList = "region_list"
		case tagList = "tag_list"
		case reportSlug = "report_slug"
		case getArticleTypeDisplay = "get_article_type_display"
		case getStatusDisplay = "get_status_display"
		case subscriptionPackage = "subscription_package"
	}
}

enum ArticleTypeFk: String, Codable {
	case article = "Article"
	case document = "Document"
	case memberreport = "Memberreport"
	case pushNotification = "PUSH_NOTIFICATION"
}

struct Author: Codable {
	let picture: String?
	let fullName, profileSlug: String
	
	enum CodingKeys: String, CodingKey {
		case picture
		case fullName = "full_name"
		case profileSlug = "profile_slug"
	}
}

struct FeaturedImage: Codable {
	let imageFile: String
	
	enum CodingKeys: String, CodingKey {
		case imageFile = "image_file"
	}
}

enum GetStatusDisplay: String, Codable {
	case published = "Published"
}

struct RegionList: Codable {
	let name: Name
	let slug: String
}

enum Name: String, Codable {
	case east = "East"
	case national = "National"
	case north = "North"
}

struct SubscriptionPackage: Codable {
	let name: String
	let id: Int
}

struct TagList: Codable {
	let slug, title: String
}

struct Metadata: Codable {
}

// MARK: Encode/decode helpers

class JSONNull: Codable, Hashable {
	
	public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
		return true
	}
	
	public var hashValue: Int {
		return 0
	}
	
	public init() {}
	
	public required init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		if !container.decodeNil() {
			throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
		}
	}
	
	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encodeNil()
	}
}

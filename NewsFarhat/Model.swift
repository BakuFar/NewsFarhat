//
//  Model.swift
//  NewsFarhat
//
//  Created by Фархат Сталбек уулу on 3/4/23.
//

import Foundation

//// MARK: - News
//struct NewsData: Codable {
//    var status: String
//    var totalResults: Int
//    var articles: [Article]
//}
//
//// MARK: - Article
//struct Article: Codable {
//    var source: Source
//    var author: String?
//    var title, description: String
//    var url: String
//    var urlToImage: String?
//    var publishedAt: Date
//    var content: String
//}
//
//// MARK: - Source
//struct Source: Codable {
//    var id: String?
//    var name: String
//}

// MARK: - NewsData
struct NewsData: Codable {
    var products: [Product]
    var total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable {
    var id: Int
    var title, description: String
    var price: Int
    var discountPercentage, rating: Double
    var stock: Int
    var brand, category: String
    var thumbnail: String
    var images: [String]
}


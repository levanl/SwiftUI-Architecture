//
//  MainPageModel.swift
//  SwiftUI-Architecture
//
//  Created by Levan Loladze on 03.01.24.
//

import Foundation

// MARK: - Nasa
struct Nasa: Codable {
    let collection: Collection
}

// MARK: - Collection
struct Collection: Codable {
    let version: String
    let href: String
    let items: [Item]
    let metadata: Metadata
    let links: [CollectionLink]
}

// MARK: - Item
struct Item: Codable, Identifiable {
    let id = UUID()
    let href: String
    let data: [Datum]
    let links: [ItemLink]
}

// MARK: - Datum
struct Datum: Codable {
    let center, title: String
    let keywords: [String]
    let nasaID: String
    let mediaType, description: String

    enum CodingKeys: String, CodingKey {
        case center, title, keywords
        case nasaID = "nasa_id"
        case mediaType = "media_type"
        case description
    }
}

// MARK: - ItemLink
struct ItemLink: Codable {
    let href: String
    let rel: String
    let render: String?
}

// MARK: - CollectionLink
struct CollectionLink: Codable {
    let rel, prompt: String
    let href: String
}

// MARK: - Metadata
struct Metadata: Codable {
    let totalHits: Int

    enum CodingKeys: String, CodingKey {
        case totalHits = "total_hits"
    }
}


typealias Sources = [String]

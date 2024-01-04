//
//  MainPageModel.swift
//  SwiftUI-Architecture
//
//  Created by Levan Loladze on 03.01.24.
//

import Foundation

// MARK: - Nasa
struct Nasa: Decodable {
    let collection: Collection
}

// MARK: - Collection
struct Collection: Decodable {
    let version: String
    let href: String
    let items: [Item]
    let metadata: Metadata
    let links: [CollectionLink]
}

// MARK: - Item
struct Item: Decodable, Identifiable {
    let id = UUID()
    let href: String
    let data: [Datum]
    let links: [ItemLink]
}

// MARK: - Datum
struct Datum: Decodable {
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
struct ItemLink: Decodable {
    let href: String
    let rel: String
    let render: String?
}

// MARK: - CollectionLink
struct CollectionLink: Decodable {
    let rel, prompt: String
    let href: String
}

// MARK: - Metadata
struct Metadata: Decodable {
    let totalHits: Int

    enum CodingKeys: String, CodingKey {
        case totalHits = "total_hits"
    }
}


typealias Sources = [String]

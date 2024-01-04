//
//  APODPageModel.swift
//  SwiftUI-Architecture
//
//  Created by Levan Loladze on 04.01.24.
//

import Foundation

struct APODModel: Codable {
    let date, explanation: String
    let hdurl: String
    let mediaType, serviceVersion, title: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case date, explanation, hdurl
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title, url
    }
}


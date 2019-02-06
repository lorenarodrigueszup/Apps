//
//  Quote.swift
//  AppPensamentos
//
//  Created by Lorena Rodrigues on 05/02/19.
//  Copyright © 2019 Lorena Rodrigues. All rights reserved.
//

import Foundation

struct Quote: Codable {
    let quote: String
    let author: String
    let image: String

    var quoteFormatted: String {
        return "❝" + quote + "❞"
    }

    var authorFormatted: String {
        return "- " + author + " -"
    }
}

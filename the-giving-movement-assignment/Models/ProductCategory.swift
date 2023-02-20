//
//  ProductCategory.swift
//  the-giving-movement-assignment
//
//  Created by Sakib Kurtic on 2/19/23.
//

import Foundation

struct Category: Codable {
    let tag: String
    let order, count: Int

    enum CodingKeys: String, CodingKey {
        case tag
        case order = "__order"
        case count
    }
}

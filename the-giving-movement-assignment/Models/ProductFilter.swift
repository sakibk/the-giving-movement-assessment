//
//  ProductFilter.swift
//  the-giving-movement-assignment
//
//  Created by Sakib Kurtic on 2/19/23.
//

import Foundation

struct Filter: Codable {
    let inStockSize: [InStockSize]
    let category, colour, style, gender: [Category]

    enum CodingKeys: String, CodingKey {
        case inStockSize = "In Stock Size"
        case category = "Category"
        case colour = "Colour"
        case style = "Style"
        case gender = "Gender"
    }
}

struct InStockSize: Codable {
    let tag: String
    let order: Int

    enum CodingKeys: String, CodingKey {
        case tag
        case order = "__order"
    }
}

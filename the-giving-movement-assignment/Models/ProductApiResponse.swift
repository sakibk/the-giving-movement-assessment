//
//  ProductApiResponse.swift
//  the-giving-movement-assignment
//
//  Created by Sakib Kurtic on 2/19/23.
//

import Foundation

struct ProductResponse: Codable {
    let filters: [Filter]
    let products: [Product]
    let page, totalPages: Int

    enum CodingKeys: String, CodingKey {
        case filters, products, page
        case totalPages = "total_pages"
    }
}

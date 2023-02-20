//
//  Product.swift
//  the-giving-movement-assignment
//
//  Created by Sakib Kurtic on 2/19/23.
//

import Foundation

struct Product: Codable {
    let productID: Int
    let productTitle, productHandle: String
    let productTags: [String]
    let productVariants: [Variant]
    let productOptions: [ProductOption]
    let productImage: String
    let productAllImages: [String]
    let relatedColors: [RelatedColor]
    let meta: Meta
    let order: Int

    enum CodingKeys: String, CodingKey {
        case productID = "product_id"
        case productTitle = "product_title"
        case productHandle = "product_handle"
        case productTags = "product_tags"
        case productVariants = "product_variants"
        case productOptions = "product_options"
        case productImage = "product_image"
        case productAllImages = "product_all_images"
        case relatedColors = "related_colors"
        case meta
        case order = "__order"
    }
}

// MARK: - Meta
struct Meta: Codable {
    let count: Count
}

// MARK: - Count
struct Count: Codable {
    let lowerBound: Int
}

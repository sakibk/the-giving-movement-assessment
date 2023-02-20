//
//  ProductVariant.swift
//  the-giving-movement-assignment
//
//  Created by Sakib Kurtic on 2/19/23.
//

import Foundation

struct Variant: Codable {
    let id: Int
    let option1: String
    let option2: String
    let option3: String?
    let price: String
    let sku: String
    let inventoryPolicy: String
    let inventoryQuantity: Int
    let inventoryItemID: Int?

    enum CodingKeys: String, CodingKey {
        case id, option1, option2, option3, price
        case sku
        case inventoryPolicy = "inventory_policy"
        case inventoryQuantity = "inventory_quantity"
        case inventoryItemID = "inventory_item_id"
    }
}

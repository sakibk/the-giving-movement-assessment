//
//  ProductRelatedColor.swift
//  the-giving-movement-assignment
//
//  Created by Sakib Kurtic on 2/19/23.
//

import Foundation

struct RelatedColor: Codable {
    let mPID: Int
    let mPHandle: String
    let mPPublished: String
    let mPVariants: [Variant]
    let mPImage: String
    let mPAllImages: [String]
    let mPAvailable: Bool

    enum CodingKeys: String, CodingKey {
        case mPID = "m_p_id"
        case mPHandle = "m_p_handle"
        case mPPublished = "m_p_published"
        case mPVariants = "m_p_variants"
        case mPImage = "m_p_image"
        case mPAllImages = "m_p_all_images"
        case mPAvailable = "m_p_available"
    }
}

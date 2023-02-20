//
//  ProductsAPI.swift
//  the-giving-movement-assignment
//
//  Created by Sakib Kurtic on 2/19/23.
//

import Foundation

enum ProductsAPI {
    case getProducts(page: Int, productType: ProductType)
}

extension ProductsAPI: EndPointType {
    var baseURL: URL {
        return URL(string: "https://appsthegivingmovement.com")!
    }

    var path: String {
        switch self {
        // swiftlint: disable all empty_enum_arguments
        case .getProducts(_, _):
            return "/facet"
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        case .getProducts(_, _):
            return .get
        }
    }

    var task: HTTPTask {
        switch self {
        case .getProducts(let page, let productType):
            let parameters: Parameters = ["collection_id": productType.rawValue,
                              "device": "desktop",
                              "needFil": false,
                              "page": page]
            return .requestParameters(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: parameters)
        }
    }

    var headers: HTTPHeaders? {
        return nil
    }
}

enum ProductType: Int {
    case man = 266821926947
    case woman = 266821828643
    case kids = 262518997027
    case family = 266821304355
}

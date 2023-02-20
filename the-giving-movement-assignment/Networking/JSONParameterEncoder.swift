//
//  JSONParameterEncoder.swift
//  the-giving-movement-assignment
//
//  Created by Sakib Kurtic on 2/19/23.
//

import Foundation

struct JSONParameterEncoder: ParameterEncoder {

    init() {}

    func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = jsonData
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        } catch {
            throw NetworkError.encodingFailed
        }
    }
}

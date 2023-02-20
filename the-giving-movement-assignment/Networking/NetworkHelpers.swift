//
//  NetworkHelpers.swift
//  the-giving-movement-assignment
//
//  Created by Sakib Kurtic on 2/19/23.
//

import Foundation

enum NetworkEnvironment: Int, CaseIterable {
    case dev = 0
    case prod = 1
}

public enum TGAResult<String> {
case success
case failure(String)
}

public enum NetworkResponse: String {
case success
case badRequest = "Bad request"
case serverError = "Something went wrong"
case outdated = "The url you requested is outdated."
case failed = "Network request failed."
case noData = "Response returned with no data to decode."
case unableToDecode = "We could not decode the response."
}

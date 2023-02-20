//
//  NetworkManager.swift
//  the-giving-movement-assignment
//
//  Created by Sakib Kurtic on 2/19/23.
//

import Foundation

protocol NetworkManagerInterface {
    func getProducts(productType: ProductType, page: Int, completion: @escaping(_ response: [Product]?, _ error: String?) -> Void
    )
}

struct NetworkManager {
    static var environment = NetworkEnvironment.dev
    private let router = Router<ProductsAPI>()

    public init() {
    }

    func getProducts(productType: ProductType, page: Int, completion: @escaping(_ response: [Product]?, _ error: String?) -> Void
    ) {
        router.request(.getProducts(page: page, productType: productType)) { data, response, error in
            guard error == nil else {
                completion(nil, error?.localizedDescription ?? "Unknown error occured")
                return
            }
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode(ProductResponse.self, from: responseData)
                        completion(apiResponse.products, nil)
                    } catch {
                        print(error)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    public func handleNetworkResponse(_ response: HTTPURLResponse) -> TGAResult<String> {
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.badRequest.rawValue)
        case 501...599: return .failure(NetworkResponse.serverError.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}

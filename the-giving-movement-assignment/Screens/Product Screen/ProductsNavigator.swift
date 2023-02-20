//
//  ProductsNavigator.swift
//  the-giving-movement-assignment
//
//  Created by Sakib Kurtic on 2/19/23.
//

import Foundation

protocol ProductNavigatorProtocol {
    func navigateToProductDetails()
}

class ProductsNavigator: AppNavigator, ProductNavigatorProtocol {
    func navigateToProductDetails() {
        print("navigate To Product Details")
    }
}

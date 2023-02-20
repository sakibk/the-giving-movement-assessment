//
//  ProductsViewModel.swift
//  the-giving-movement-assignment
//
//  Created by Sakib Kurtic on 2/19/23.
//

import Foundation

protocol ProductsViewModelDelegate: AnyObject {
    func reloadCollection()
    func stopLoader()
}

class ProductsViewModel {
    private let navigator: ProductsNavigator
    private let networkManager: NetworkManager

    weak var delegate: ProductsViewModelDelegate?
    var itemsPage: Int = 1
    var items: [Product] = []

    var numberOfItems: Int {
        return items.count
    }

    init(navigator: ProductsNavigator, networkManager: NetworkManager, delegate: ProductsViewModelDelegate?) {
        self.navigator = navigator
        self.networkManager = networkManager
        self.delegate = delegate
        loadItems()
    }

    func loadItems() {
        networkManager.getProducts(productType: .man, page: itemsPage, completion: { result, error in
            guard error == nil else {
                print("error")
                return
            }
            guard let result = result else {
                return
            }
            self.items = result
            self.delegate?.reloadCollection()
            self.delegate?.stopLoader()
        })
    }

    func navigateBack() {
        navigator.goBack()
    }

    func navigateHome() {
        navigator.popToLanding()
    }

    func navigateToSearch() {
        navigator.presentOtherScreens(with: "Search")
    }

    func navigateToFavorites() {
        navigator.presentOtherScreens(with: "Favorites")
    }

    func navigateToShoppingBag() {
        navigator.presentOtherScreens(with: "Shopping Bag")
    }
}

//
//  LandingViewModel.swift
//  the-giving-movement-assignment
//
//  Created by Sakib Kurtic on 2/17/23.
//

import Foundation

class LandingViewModel {
    private let navigator: AppNavigatorProtocol&HeaderNavigatorProtocol

    var infoStringLeft: String = "SAME-DAY DELIVERY IN UAE"
    var infoStringRight: String = "2-3 DAYS' DELIVERY IN GCC"

    init(navigator: AppNavigatorProtocol&HeaderNavigatorProtocol) {
        self.navigator = navigator
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

    func navigateToProducts(of type: ProductType) {
        navigator.navigateToProducts(of: type)
    }

    func navigate(to option: String) {
        if option == "WOMEN" {
            navigateToProducts(of: .woman)
        } else if option == "MEN" {
            navigateToProducts(of: .man)
        } else if option == "MODEST" {
            navigateToProducts(of: .family)
        } else if option == "KIDS" {
            navigateToProducts(of: .kids)
        }
        print("unimplemented")
    }
}

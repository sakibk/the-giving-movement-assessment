//
//  MockNavigator.swift
//  the-giving-movement-assignmentTests
//
//  Created by Sakib Kurtic on 2/20/23.
//

import UIKit
@testable import the_giving_movement_assignment

class MockNavigator: AppNavigatorProtocol, HeaderNavigatorProtocol {
    var navigationController: UINavigationController?
    var splashCounter = 0
    var landingCounter = 0
    var productsCounter = 0
    var otherCounter = 0
    var navigationCounter = 0

    func goToSplashScreen() {
        splashCounter += 1
        navigationCounter += 1
    }

    func goToLandingScreen() {
        landingCounter += 1
        navigationCounter += 1
    }

    func navigateToProducts(of type: ProductType) {
        productsCounter += 1
        navigationCounter += 1
    }

    func goBack() {
        navigationCounter -= 1
    }

    func popToLanding() {
        splashCounter = 0
        productsCounter = 0
    }

    func dismiss(animated: Bool, completion: (() -> Void)?) { }

    func presentOtherScreens(with title: String) {
        otherCounter += 1
    }

    func dismissOtherScreens() {
        otherCounter -= 1
    }
}

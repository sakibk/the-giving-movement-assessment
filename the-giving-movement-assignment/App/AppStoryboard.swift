//
//  AppStoryboard.swift
//  the-giving-movement-assignment
//
//  Created by Sakib Kurtic on 2/17/23.
//

import UIKit

enum AppStoryboard: String {
    case launchScreen = "LaunchScreen"
    case landingScreen = "LandingScreen"
    case productsScreen = "ProductsScreen"
    case navigationScreen = "NavigationScreen"
    case otherScreens = "OtherScreens"

    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }

    // swiftlint:disable force_cast
    func viewController<T: UIViewController>(viewControllerClass: T.Type) -> T {
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        return instance.instantiateViewController(withIdentifier: storyboardID) as! T
    }
    // swiftlint:enable force_cast

    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}

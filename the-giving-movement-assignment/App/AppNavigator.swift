//
//  AppNavigator.swift
//  the-giving-movement-assignment
//
//  Created by Sakib Kurtic on 2/17/23.
//

import UIKit

protocol AppNavigatorProtocol {
    var navigationController: UINavigationController? { get set }
    func goToSplashScreen()
    func goToLandingScreen()
    func navigateToProducts(of type: ProductType)
    func goBack()
    func popToLanding()
    func dismiss(animated: Bool, completion: (() -> Void)?)
}

class AppNavigator: NSObject, AppNavigatorProtocol {
    weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
        super.init()
        navigationController?.isNavigationBarHidden = true
    }

    func goToSplashScreen() {
        let launchScreenViewController = LaunchScreenViewController.instantiateFromAppStoryboard(
            appStoryboard: .launchScreen
        )
        let launchScreenNavigator = self
        launchScreenViewController.viewModel = LaunchScreenViewModel(navigator: launchScreenNavigator)
        navigationController?.pushViewController(launchScreenViewController, animated: false)
    }

    func goToLandingScreen() {
        navigationController?.viewControllers.removeAll()
        let landingViewController =
            LandingViewController.instantiateFromAppStoryboard(appStoryboard: .landingScreen)
        let landingScreenNavigator = self
        landingViewController.viewModel = LandingViewModel(navigator: landingScreenNavigator)
        navigationController?.pushViewController(landingViewController, animated: false)
    }

    func navigateToProducts(of type: ProductType) {
        let productsViewController = ProductsViewController.instantiateFromAppStoryboard(appStoryboard: .productsScreen)
        let productsNavigator = ProductsNavigator(navigationController: self.navigationController)
        productsViewController.viewModel = ProductsViewModel(navigator: productsNavigator, networkManager: NetworkManager(), delegate: productsViewController)
        navigationController?.pushViewController(productsViewController, animated: true)
    }

    func goBack() {
        navigationController?.popViewController(animated: true)
    }

    func popToLanding() {
        let controllers = navigationController?.viewControllers
        if let landingViewController = controllers?.first(where: { $0 is LandingViewController }) {
            navigationController?.popToViewController(landingViewController, animated: true)
        }
    }

    func dismiss(animated: Bool, completion: (() -> Void)? = nil) {
        navigationController?.dismiss(animated: animated, completion: completion)
    }
}

protocol HeaderNavigatorProtocol {
    func presentOtherScreens(with title: String)
    func dismissOtherScreens()
}

extension AppNavigator: HeaderNavigatorProtocol {
    func presentOtherScreens(with title: String) {
        let otherScreensVC = OtherScreensViewController.instantiateFromAppStoryboard(appStoryboard: .otherScreens)
        let productsNavigator = ProductsNavigator(navigationController: self.navigationController)
        otherScreensVC.viewModel = OtherScreensViewModel(navigator: productsNavigator, screenTitle: title)
        otherScreensVC.modalPresentationStyle = .overFullScreen
        navigationController?.navigationBar.isHidden = false
        navigationController?.present(otherScreensVC, animated: true)
    }

    func dismissOtherScreens() {
        navigationController?.isNavigationBarHidden = true
        navigationController?.dismiss(animated: true)
    }
}

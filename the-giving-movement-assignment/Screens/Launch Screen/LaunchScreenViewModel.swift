//
//  LaunchScreenViewModel.swift
//  the-giving-movement-assignment
//
//  Created by Sakib Kurtic on 2/17/23.
//

import Foundation

class LaunchScreenViewModel {

    private var navigator: AppNavigator?

    init(navigator: AppNavigator?) {
        self.navigator = navigator
    }

    func setAppNavigator(navigator: AppNavigator?) {
        self.navigator = navigator
    }

    func viewDidAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            self.navigator?.goToLandingScreen()
        }
    }
}

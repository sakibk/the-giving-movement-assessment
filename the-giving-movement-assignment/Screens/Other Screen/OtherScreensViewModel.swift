//
//  OtherScreensViewModel.swift
//  the-giving-movement-assignment
//
//  Created by Sakib Kurtic on 2/20/23.
//

import Foundation

class OtherScreensViewModel {
    var appNavigator: AppNavigator
    var screenTitle: String

    init(navigator: AppNavigator, screenTitle: String) {
        self.appNavigator = navigator
        self.screenTitle = screenTitle
    }
}

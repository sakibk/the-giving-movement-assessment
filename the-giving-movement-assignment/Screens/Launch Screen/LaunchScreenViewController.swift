//
//  LaunchScreenViewController.swift
//  the-giving-movement-assignment
//
//  Created by Sakib Kurtic on 2/17/23.
//

import UIKit

class LaunchScreenViewController: UIViewController {
    var viewModel: LaunchScreenViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.viewDidAppear()
    }
}

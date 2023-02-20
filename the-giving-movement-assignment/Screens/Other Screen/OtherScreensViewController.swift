//
//  OtherScreensViewController.swift
//  the-giving-movement-assignment
//
//  Created by Sakib Kurtic on 2/20/23.
//

import UIKit

class OtherScreensViewController: UIViewController {
    @IBOutlet weak var barTitle: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var barBackButton: UIButton!

    var viewModel: OtherScreensViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        titleLabel.text = viewModel.screenTitle
        barTitle.text = viewModel.screenTitle
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        viewModel.appNavigator.dismissOtherScreens()
    }
}

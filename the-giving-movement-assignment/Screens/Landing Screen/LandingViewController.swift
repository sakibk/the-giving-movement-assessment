//
//  LandingViewController.swift
//  the-giving-movement-assignment
//
//  Created by Sakib Kurtic on 2/16/23.
//

import UIKit

class LandingViewController: UIViewController {
    @IBOutlet weak var textSwitchView: FadeTextSwitchView!
    @IBOutlet weak var topHeaderView: HeaderTopView!
    @IBOutlet weak var infoLabelLeft: UILabel!
    @IBOutlet weak var infoLabelRight: UILabel!
    @IBOutlet weak var shopWomanButton: PrimaryButton!
    @IBOutlet weak var shopManButton: PrimaryButton!
    @IBOutlet weak var shopFamilyButton: PrimaryButton!
    @IBOutlet weak var shopKidsButton: PrimaryButton!
    @IBOutlet weak var sideMenuView: SideMenuView!
    @IBOutlet weak var sideBarLeadingConstraint: NSLayoutConstraint!

    var viewModel: LandingViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        setupDelegates()
    }

    func setupUI() {
        self.edgesForExtendedLayout = []
        sideMenuView.backgroundColor = .white.withAlphaComponent(0.9)
        infoLabelLeft.text = viewModel.infoStringLeft
        infoLabelRight.text = viewModel.infoStringRight
        textSwitchView.setupLabelArray(labels: TextSwitchHelper.bannerStrings)
    }

    func setupDelegates() {
        topHeaderView.delegate = self
        sideMenuView.delegate = self
    }

    @IBAction func didTapGoProducts(_ sender: Any) {
        guard let buttonTapped = sender as? PrimaryButton else { return }
        if buttonTapped == shopWomanButton {
            viewModel.navigateToProducts(of: .woman)
        } else if buttonTapped == shopManButton {
            viewModel.navigateToProducts(of: .man)
        } else if buttonTapped == shopFamilyButton {
            viewModel.navigateToProducts(of: .family)
        } else if buttonTapped == shopKidsButton {
            viewModel.navigateToProducts(of: .kids)
        }
    }
}

extension LandingViewController: HeaderTopViewDelegate {
    func didTapSideMenu() {
        self.sideBarLeadingConstraint.constant = UIScreen.main.bounds.width
        sideMenuView.superview?.bringSubviewToFront(sideMenuView)
        UIView.animate(withDuration: 0.3, delay: 0, options: []) {
            self.view.layoutIfNeeded()
        }
    }

    func didTapSearch() {
        viewModel.navigateToSearch()
    }

    func didTapHome() {
        viewModel.navigateHome()
    }

    func didTapFavorites() {
        viewModel.navigateToFavorites()
    }

    func didTapShoppingBag() {
        viewModel.navigateToShoppingBag()
    }
}

extension LandingViewController: SideMenuViewDelegate {
    func didTapCloseButton() {
        self.sideBarLeadingConstraint.constant = 0
        UIView.animate(withDuration: 0.3, delay: 0, options: []) {
            self.view.layoutIfNeeded()
        }
    }

    func didSelect(option: String) {
        didTapCloseButton()
        viewModel.navigate(to: option)
    }
}

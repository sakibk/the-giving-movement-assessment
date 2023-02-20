//
//  HeaderTopView.swift
//  the-giving-movement-assignment
//
//  Created by Sakib Kurtic on 2/17/23.
//

import UIKit

protocol HeaderTopViewDelegate: AnyObject {
    func didTapSideMenu()
    func didTapSearch()
    func didTapHome()
    func didTapFavorites()
    func didTapShoppingBag()
}

class HeaderTopView: UIView {
    @IBOutlet weak var sideBarBackButton: UIButton!

    var contentView: UIView?
    weak var delegate: HeaderTopViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }

    private func xibSetup() {
        contentView = loadViewFromNib()
        setupXibView(with: contentView)
    }

    override func setupAfterLoadingFromNib() {
    }

    func setHome(isCurrentHome: Bool) {
        let sideBarImage = UIImage(named: "iconHamburger")
        let backImage = UIImage(systemName: "chevron.left")
        sideBarBackButton.setImage(isCurrentHome ? sideBarImage : backImage, for: .normal)
        sideBarBackButton.tintColor = .darkGray
    }

    @IBAction func sideMenuButtonTap(_ sender: Any) {
        delegate?.didTapSideMenu()
    }

    @IBAction func searchButtonTap(_ sender: Any) {
        delegate?.didTapSearch()
    }

    @IBAction func homeButtonTap(_ sender: Any) {
        delegate?.didTapHome()
    }

    @IBAction func favoritesButtonTap(_ sender: Any) {
        delegate?.didTapFavorites()
    }

    @IBAction func shoppingBagButtonTap(_ sender: Any) {
        delegate?.didTapShoppingBag()
    }
}

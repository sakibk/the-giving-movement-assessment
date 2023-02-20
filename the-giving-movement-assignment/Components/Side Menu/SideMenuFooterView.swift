//
//  SideMenuFooterView.swift
//  the-giving-movement-assignment
//
//  Created by Sakib Kurtic on 2/20/23.
//

import UIKit

class SideMenuFooterView: UIView {
    var contentView: UIView?

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
}

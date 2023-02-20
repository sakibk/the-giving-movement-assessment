//
//  PrimaryButton.swift
//  the-giving-movement-assignment
//
//  Created by Sakib Kurtic on 2/17/23.
//

import Foundation
import UIKit

class PrimaryButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeButton()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeButton()
    }

    fileprivate func initializeButton() {
        backgroundColor = .black
        titleLabel?.font = .systemFont(ofSize: 18)
        setTitleColor(.white, for: .normal)
    }
}

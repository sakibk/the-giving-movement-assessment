//
//  UICollectionView+Extension.swift
//  the-giving-movement-assignment
//
//  Created by Sakib Kurtic on 2/17/23.
//

import UIKit

extension UICollectionView {
    func registerItem(with nibName: String) {
        self.register(
            UINib(nibName: nibName, bundle: nil),
            forCellWithReuseIdentifier: nibName
        )
    }
}

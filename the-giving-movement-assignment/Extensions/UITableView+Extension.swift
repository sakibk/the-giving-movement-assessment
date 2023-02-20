//
//  UITableView+Extension.swift
//  the-giving-movement-assignment
//
//  Created by Sakib Kurtic on 2/17/23.
//

import UIKit

extension UITableView {
    func registerCell(with nibName: String) {
        self.register(
            UINib(nibName: nibName, bundle: nil),
            forCellReuseIdentifier: nibName
        )
    }
}

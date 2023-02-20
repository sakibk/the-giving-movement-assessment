//
//  UIView+Extension.swift
//  the-giving-movement-assignment
//
//  Created by Sakib Kurtic on 2/17/23.
//

import UIKit

extension UIView {
    static var identifier: String {
        return String(describing: self)
    }
}

protocol LoadingViewFromNib {
    func setupXibView(
        with contentView: UIView?,
        andColor backgroundColor: UIColor,
        andIdentifier viewIdentifier: String?
    )
    func loadViewFromNib() -> UIView!
    func setupAfterLoadingFromNib()
}

extension UIView: LoadingViewFromNib {
    func setupXibView(
         with contentView: UIView?,
         andColor backgroundColor: UIColor = .clear,
         andIdentifier viewIdentifier: String? = nil
     ) {
         if let contentView = contentView {
             contentView.frame = bounds
             contentView.backgroundColor = backgroundColor
             contentView.autoresizingMask = [
                 UIView.AutoresizingMask.flexibleWidth,
                 UIView.AutoresizingMask.flexibleHeight
             ]
             if let identifier = viewIdentifier {
                 contentView.accessibilityIdentifier = identifier
             }
             addSubview(contentView)
         }
     }

     @discardableResult func loadViewFromNib() -> UIView! {
         let nib = UINib(nibName: String(describing: type(of: self)), bundle: .main)
         let view = nib.instantiate(withOwner: self, options: nil).first as? UIView ?? UIView()
         setupAfterLoadingFromNib()
         return view
     }

     @objc func setupAfterLoadingFromNib() { }
}

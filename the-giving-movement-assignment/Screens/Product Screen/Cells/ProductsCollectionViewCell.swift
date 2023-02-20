//
//  ProductsCollectionViewCell.swift
//  the-giving-movement-assignment
//
//  Created by Sakib Kurtic on 2/20/23.
//

import UIKit
import SDWebImage

class ProductsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }

    func setupItem(with product: Product) {
        imageView.sd_setImage(with: URL(string: product.productImage))
        titleLabel.text = product.productTitle
        priceLabel.text = (product.productVariants.first?.price ?? "200") + "AED"
    }
}

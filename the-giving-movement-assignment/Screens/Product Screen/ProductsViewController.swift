//
//  ProductsViewController.swift
//  the-giving-movement-assignment
//
//  Created by Sakib Kurtic on 2/19/23.
//

import Foundation
import UIKit

class ProductsViewController: UIViewController {

    @IBOutlet weak var textSwitchView: FadeTextSwitchView!
    @IBOutlet weak var headerTopView: HeaderTopView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var viewModel: ProductsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupDelegates()
        setupUI()
    }

    func setupUI() {
        headerTopView.setHome(isCurrentHome: false)
        textSwitchView.setupLabelArray(labels: TextSwitchHelper.bannerStrings)
        activityIndicator.startAnimating()
    }

    func setupDelegates() {
        headerTopView.delegate = self
    }

    func setupCollectionView() {
        setupFlowLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        registerItems()
    }

    func setupFlowLayout() {
        if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = 10
            layout.minimumInteritemSpacing = 10
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            let width = (collectionView!.bounds.width-30)/2
            let size = CGSize(width: width, height: (width+(width*0.5)))
            layout.itemSize = size
        }
    }

    func registerItems() {
        collectionView.registerItem(with: ProductsCollectionViewCell.identifier)
    }
}

extension ProductsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfItems > 0 ? 1 : 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowLayout?.minimumInteritemSpacing ?? 0.0) + (flowLayout?.sectionInset.left ?? 0.0) + (flowLayout?.sectionInset.right ?? 0.0)
        let size: CGFloat = (collectionView.frame.size.width - space) / 2.0
        return CGSize(width: size, height: size*2)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsCollectionViewCell.identifier, for: indexPath) as? ProductsCollectionViewCell
        item?.setupItem(with: viewModel.items[indexPath.item])
        return item ?? UICollectionViewCell()
    }
}

extension ProductsViewController: ProductsViewModelDelegate {
    func reloadCollection() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

    func stopLoader() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
        }
    }
}

extension ProductsViewController: HeaderTopViewDelegate {
    func didTapSideMenu() {
        viewModel.navigateBack()
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

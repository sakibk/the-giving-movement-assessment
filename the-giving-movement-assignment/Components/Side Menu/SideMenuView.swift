//
//  SideMenuView.swift
//  the-giving-movement-assignment
//
//  Created by Sakib Kurtic on 2/20/23.
//

import UIKit

protocol SideMenuViewDelegate: AnyObject {
    func didTapCloseButton()
    func didSelect(option: String)
}

class SideMenuView: UIView {
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var contentView: UIView?

    weak var delegate: SideMenuViewDelegate?
    var options: [String] = ["WOMEN",
                             "MEN",
                             "MODEST",
                             "KIDS",
                             "SUSTAINABILITY",
                             "OUR STORY",
                             "LOGIN"]

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
        setupTableView()
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        registerCells()
    }

    func registerCells() {
        tableView.registerCell(with: SideBarTableViewCell.identifier)
    }

    @IBAction func classButtonTapped(_ sender: Any) {
        delegate?.didTapCloseButton()
    }
}

extension SideMenuView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SideBarTableViewCell.identifier) as? SideBarTableViewCell
        cell?.setupWith(optionLabel: options[indexPath.row])
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelect(option: options[indexPath.row])
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = SideMenuFooterView()

        return view
    }
}

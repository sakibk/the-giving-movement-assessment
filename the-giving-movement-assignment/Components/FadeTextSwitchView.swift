//
//  FadeTextSwitchView.swift
//  the-giving-movement-assignment
//
//  Created by Sakib Kurtic on 2/17/23.
//

import Foundation
import UIKit

// swiftlint: disable all multiple_closures_with_trailing_closure
class FadeTextSwitchView: UIView {
    @IBOutlet weak var textLabel: UILabel!
    
    var contentView: UIView?
    var labelsText: [String] = []
    var textIndex = 0
    var timer: Timer?

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

    func setupLabelArray(labels: [String]) {
        labelsText = labels
        startTimer()
    }

    func startTimer() {
        timer = Timer(timeInterval: 1.5, target: self, selector: #selector(startSwitchingTexts), userInfo: nil, repeats: true)
        RunLoop.current.add(timer!, forMode: .common)
    }

    @objc
    func startSwitchingTexts() {
        self.textLabel.text = self.getNextLabelValue()
        UIView.animate(withDuration: 0.25, animations: {
            self.textLabel.alpha = 1
        }) {_ in
            UIView.animate(withDuration: 0.25, delay: 0.8,  animations: {
                self.textLabel.alpha = 0
            }) { _ in
            }
        }
    }

    func getNextLabelValue() -> String {
        if textIndex + 1 == labelsText.count {
            textIndex = 0
        } else {
            textIndex += 1
        }
        return labelsText[textIndex]
    }
}

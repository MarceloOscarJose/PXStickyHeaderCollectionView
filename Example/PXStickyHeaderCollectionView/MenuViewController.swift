//
//  MenuViewController.swift
//  PXStickyHeaderCollectionView_Example
//
//  Created by Marcelo Oscar José on 22/07/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    let titleLabel: UILabel = UILabel()
    let button1: UIButton = UIButton()
    let button2: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupControls()
    }

    func setupControls() {
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(titleLabel)
        self.view.addSubview(button1)
        self.view.addSubview(button2)
        setupConstraints()

        titleLabel.font = UIFont.systemFont(ofSize: 30)
        titleLabel.text = "PXStickyHeaderCollectionView"
        titleLabel.textColor = UIColor.gray
        titleLabel.adjustsFontSizeToFitWidth = true

        button1.setTitle("Intinite header hegiht", for: .normal)
        button1.setTitleColor(UIColor.black, for: .normal)
        button1.setBackgroundColor(color: UIColor.lightGray, forState: .normal)
        button1.addTarget(self, action: #selector(navigateToMainControllerInfinite), for: .touchUpInside)

        button2.setTitle("Max header hegiht", for: .normal)
        button2.setTitleColor(UIColor.black, for: .normal)
        button2.setBackgroundColor(color: UIColor.lightGray, forState: .normal)
        button2.addTarget(self, action: #selector(navigateToMainController), for: .touchUpInside)
    }

    func setupConstraints() {
        titleLabel.autoPinEdge(.top, to: .top, of: self.view, withOffset: 90)
        titleLabel.autoPinEdge(.left, to: .left, of: self.view, withOffset: 30)
        titleLabel.autoPinEdge(.right, to: .right, of: self.view, withOffset: -30)

        button1.autoPinEdge(.top, to: .top, of: titleLabel, withOffset: 90)
        button1.autoPinEdge(.left, to: .left, of: self.view, withOffset: 30)
        button1.autoPinEdge(.right, to: .right, of: self.view, withOffset: -30)
        button1.autoSetDimension(.height, toSize: 50)

        button2.autoPinEdge(.top, to: .top, of: button1, withOffset: 90)
        button2.autoPinEdge(.left, to: .left, of: self.view, withOffset: 30)
        button2.autoPinEdge(.right, to: .right, of: self.view, withOffset: -30)
        button2.autoSetDimension(.height, toSize: 50)
    }

    @objc func navigateToMainControllerInfinite() {
        self.navigationController?.pushViewController(MainViewController(), animated: true)
    }

    @objc func navigateToMainController() {
        self.navigationController?.pushViewController(MainViewController(), animated: true)
    }
}

extension UIButton {
    func setBackgroundColor(color: UIColor, forState: UIControlState) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.setBackgroundImage(colorImage, for: forState)
    }
}

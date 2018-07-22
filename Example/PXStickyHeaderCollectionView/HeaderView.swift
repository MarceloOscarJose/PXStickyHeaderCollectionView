//
//  HeaderView.swift
//  PXStickyHeaderCollectionView_Example
//
//  Created by Marcelo Oscar José on 21/07/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import PureLayout

class HeaderView: UIView {

    let title: UILabel = {
        let title = UILabel()
        title.text = "Header title"
        title.font = UIFont.systemFont(ofSize: 22)
        title.textColor = UIColor.white
        return title
    }()

    let backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.image = UIImage(named: "header")
        backgroundImage.contentMode = .scaleToFill
        return backgroundImage
    }()

    var initialHeight: CGFloat!

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupControls()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        if self.initialHeight == nil {
            initialHeight = self.frame.height
        }

        let scaledFont = (22 * self.frame.height / initialHeight)
        let fontSize = scaledFont < 18 ? 18 : scaledFont > 28 ? 28 : scaledFont
        self.title.font = UIFont.systemFont(ofSize: fontSize)
    }

    func setupControls() {
        self.backgroundColor = UIColor.lightGray
        self.addSubview(backgroundImage)
        backgroundImage.autoPinEdge(.top, to: .top, of: self, withOffset: 0)
        backgroundImage.autoPinEdge(.bottom, to: .bottom, of: self, withOffset: 0)
        backgroundImage.autoAlignAxis(.vertical, toSameAxisOf: self)
        backgroundImage.addSubview(title)
    }

    func setupConstraints() {
        let topConstraint = 7.5 + Utils.sharedInstance.getStatusBarHeight()
        title.autoAlignAxis(.vertical, toSameAxisOf: backgroundImage)
        title.autoPinEdge(.top, to: .top, of: backgroundImage, withOffset: topConstraint, relation: .greaterThanOrEqual)
        title.autoPinEdge(toSuperviewEdge: .bottom, withInset: 16, relation: .lessThanOrEqual)
        title.autoSetDimension(.height, toSize: 28, relation: .greaterThanOrEqual)
    }
}

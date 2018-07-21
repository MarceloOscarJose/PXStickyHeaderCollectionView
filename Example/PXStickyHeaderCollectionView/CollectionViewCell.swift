//
//  CollectionViewCell.swift
//  PXStickyHeaderCollectionView_Example
//
//  Created by Marcelo Oscar José on 21/07/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    public func configureCell(image: UIImage?, title: String? = "") {
        self.imageView.image = image
        self.titleLabel.text = title
    }
}

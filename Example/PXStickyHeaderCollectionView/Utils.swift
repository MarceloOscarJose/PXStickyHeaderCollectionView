//
//  Utils.swift
//  PXStickyHeaderCollectionView_Example
//
//  Created by Marcelo Oscar José on 21/07/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class Utils {

    static let sharedInstance = Utils()

    func getStatusBarHeight() -> CGFloat {
        var defaultHeight: CGFloat = 20

        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            let topSafeAreaPadding = window?.safeAreaInsets.top
            if let topSafeAreaDeltaValue = topSafeAreaPadding, topSafeAreaDeltaValue > 0 {
                defaultHeight = topSafeAreaDeltaValue
            }
        }
        return defaultHeight
    }
}

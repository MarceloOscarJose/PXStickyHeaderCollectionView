//
//  PXStickyHeaderCollectionView.swift
//  PXStickyHeaderCollectionView
//
//  Created by Marcelo Oscar José on 21/07/2018.
//

import UIKit

public class PXStickyHeaderCollectionView: UIView {

    // Config vars
    public var delegate: UICollectionViewDelegateFlowLayout!
    public var dataSource: UICollectionViewDataSource {
        get {
            return collectionView.dataSource!
        }
        set {
            collectionView.dataSource = newValue
        }
    }

    public var initHeaderHeight: CGFloat!
    public var minHeaderHeight: CGFloat!
    public var maxHeaderHeight: CGFloat!

    public var collectionView: UICollectionView!
    public var headerView: UIView!

    convenience public init(initHeaderHeight: CGFloat, minHeaderHeight: CGFloat, headerView: UIView) {
        self.init(frame: .zero)

        self.initHeaderHeight = initHeaderHeight
        self.minHeaderHeight = minHeaderHeight

        self.setupControls()
        self.setupHeaderView(headerView: headerView)
    }

    convenience public init(initHeaderHeight: CGFloat, minHeaderHeight: CGFloat, maxHeaderHeight: CGFloat, headerView: UIView) {
        self.init(frame: .zero)

        self.initHeaderHeight = initHeaderHeight
        self.minHeaderHeight = minHeaderHeight
        self.maxHeaderHeight = maxHeaderHeight

        self.setupControls()
        self.setupHeaderView(headerView: headerView)
    }

    fileprivate func setupControls() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.white
        collectionView.contentInset = .zero
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.alwaysBounceVertical = true
        self.addSubview(collectionView)

        self.addConstraint(NSLayoutConstraint(item: collectionView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: collectionView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute:.bottom, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: collectionView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: collectionView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0))
    }

    fileprivate func setupHeaderView(headerView: UIView) {
        headerView.removeFromSuperview()
        self.headerView = headerView
        collectionView.addSubview(self.headerView)
        collectionView.scrollRectToVisible(.zero, animated: false)

        var headerFrame: CGRect = self.headerView.frame
        headerFrame.size.height = self.initHeaderHeight
        headerView.frame = headerFrame
    }

    override public func layoutSubviews() {
        var frame: CGRect = self.headerView.frame
        frame.size.width = self.frame.size.width
        self.headerView.frame = frame
        super.layoutSubviews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

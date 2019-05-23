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
        self.headerView = headerView

        self.setupCollectionView()
    }

    convenience public init(initHeaderHeight: CGFloat, minHeaderHeight: CGFloat, maxHeaderHeight: CGFloat, headerView: UIView) {
        self.init(frame: .zero)
        self.initHeaderHeight = initHeaderHeight
        self.minHeaderHeight = minHeaderHeight
        self.maxHeaderHeight = maxHeaderHeight
        self.headerView = headerView

        self.setupCollectionView()
    }

    fileprivate func setupCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.white
        collectionView.contentInset = .zero
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.alwaysBounceVertical = true
        self.addSubview(collectionView)

        self.addConstraint(NSLayoutConstraint(item: collectionView!, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: collectionView!, attribute: .bottom, relatedBy: .equal, toItem: self, attribute:.bottom, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: collectionView!, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: collectionView!, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0))

        self.setupHeaderView()
    }

    fileprivate func setupHeaderView() {
        collectionView.addSubview(self.headerView)
        collectionView.scrollRectToVisible(.zero, animated: false)

        var headerFrame: CGRect = self.headerView.frame
        headerFrame.size.height = self.initHeaderHeight
        headerView.frame = headerFrame
    }

    override public func layoutSubviews() {
        self.headerView.frame.size.width = self.frame.size.width
        self.collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        super.layoutSubviews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  ViewController.swift
//  PXStickyHeaderCollectionView
//
//  Created by MarceloJoseML on 07/21/2018.
//  Copyright (c) 2018 MarceloJoseML. All rights reserved.
//

import PureLayout
import PXStickyHeaderCollectionView

class ViewController: UIViewController {

    // Config vars
    let headerHeight: CGFloat = 89
    let navBarHeigth: CGFloat = 44

    let KCellId = "collectionCell"
    let KCellClass = "CollectionViewCell"

    // Data vars
    let cellModel: [(id: Int, title: String, image: String)] = [
        (id: 1, title: "First Item", image: "cellImage"),
        (id: 2, title: "Second Item", image: "cellImage"),
        (id: 3, title: "Third Item", image: "cellImage")
    ]
    
    // UI Vars
    var containerView: PXStickyHeaderCollectionView!

    // Controller override
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.setupMainScreen()
    }

    func setupMainScreen() {
        let statusBarHeigth = Utils.sharedInstance.getStatusBarHeight()
        let initHeaderHeight = headerHeight + statusBarHeigth + navBarHeigth
        let minHeaderHeight = navBarHeigth + statusBarHeigth
        
        containerView = PXStickyHeaderCollectionView(initHeaderHeight: initHeaderHeight, minHeaderHeight: minHeaderHeight, headerView: HeaderView())
        self.view.addSubview(containerView)

        containerView.autoPinEdge(.top, to: .top, of: self.view, withOffset: 0)
        containerView.autoPinEdge(.left, to: .left, of: self.view, withOffset: 0)
        containerView.autoPinEdge(.right, to: .right, of: self.view, withOffset: 0)
        containerView.autoPinEdge(.bottom, to: .bottom, of: self.view, withOffset: 0)

        containerView.collectionView.register(UINib(nibName: KCellClass, bundle: Bundle(for: ViewController.self)), forCellWithReuseIdentifier: KCellId)
        containerView.delegate = self
        containerView.dataSource = self
    }
}

// MARK: Collection delegate
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let titleCell = containerView.headerView as? CollectionViewCell {
            let scaledFont = (22 * containerView.headerView.frame.height / containerView.initHeaderHeight)
            let fontSize = scaledFont < 18 ? 18 : scaledFont > 24 ? 24 : scaledFont
            //titleCell.updateTitleFontSize(toSize: fontSize)
        }
    }

    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cellModel.count
    }

    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected item")
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KCellId, for: indexPath) as! CollectionViewCell
        cell.configureCell(image: UIImage(named: cellModel[indexPath.item].image), title: cellModel[indexPath.item].title)
        return cell
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = CGFloat(32.0)
        let availableWidth = view.frame.width - paddingSpace

        let widthPerItem = availableWidth / 2
        return CGSize(width: widthPerItem, height: 130)
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 30, left: 8, bottom: 8, right: 8)
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

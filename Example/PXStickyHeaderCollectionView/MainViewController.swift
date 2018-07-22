//
//  ViewController.swift
//  PXStickyHeaderCollectionView
//
//  Created by MarceloJoseML on 07/21/2018.
//  Copyright (c) 2018 MarceloJoseML. All rights reserved.
//

import PureLayout
import PXStickyHeaderCollectionView

public class MainViewController: UIViewController {

    // Config vars
    public var maxHeader: Bool = false
    let headerHeight: CGFloat = 130
    let navBarHeigth: CGFloat = 44

    let KCellId = "collectionCell"
    let KCellClass = "CollectionViewCell"

    // Data vars
    public var cellModel: [DataCellModel] = DataCellModel.getData(total: 16)

    // UI Vars
    var containerView: PXStickyHeaderCollectionView!

    // Controller override
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.setupMainScreen()
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupNavigationBar(traslucent: true)
    }

    func setupMainScreen() {
        let statusBarHeigth = Utils.sharedInstance.getStatusBarHeight()
        let initHeaderHeight = headerHeight
        let minHeaderHeight = navBarHeigth + statusBarHeigth

        if !maxHeader {
            containerView = PXStickyHeaderCollectionView(initHeaderHeight: initHeaderHeight, minHeaderHeight: minHeaderHeight, headerView: HeaderView())
        } else {
            containerView = PXStickyHeaderCollectionView(initHeaderHeight: initHeaderHeight, minHeaderHeight: minHeaderHeight, maxHeaderHeight: (initHeaderHeight + 80), headerView: HeaderView())
        }

        self.view.addSubview(containerView)

        containerView.autoPinEdge(.top, to: .top, of: self.view, withOffset: 0)
        containerView.autoPinEdge(.left, to: .left, of: self.view, withOffset: 0)
        containerView.autoPinEdge(.right, to: .right, of: self.view, withOffset: 0)
        containerView.autoPinEdge(.bottom, to: .bottom, of: self.view, withOffset: 0)

        containerView.collectionView.register(UINib(nibName: KCellClass, bundle: Bundle(for: MainViewController.self)), forCellWithReuseIdentifier: KCellId)
        containerView.delegate = self
        containerView.dataSource = self
    }

    func setupNavigationBar(traslucent: Bool) {
        self.navigationController?.navigationBar.isTranslucent = traslucent
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.barTintColor = .clear
        self.navigationController?.navigationBar.backgroundColor = .clear
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.topItem?.title = ""
    }
}

// MARK: Collection delegate
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
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

        let widthPerItem = availableWidth / 4
        return CGSize(width: widthPerItem, height: 100)
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 15, right: 8)
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

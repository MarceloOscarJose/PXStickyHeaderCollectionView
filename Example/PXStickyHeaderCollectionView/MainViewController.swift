//
//  ViewController.swift
//  PXStickyHeaderCollectionView
//
//  Created by MarceloJoseML on 07/21/2018.
//  Copyright (c) 2018 MarceloJoseML. All rights reserved.
//

import PureLayout
import PXStickyHeaderCollectionView

class MainViewController: UIViewController {

    // Config vars
    let headerHeight: CGFloat = 40
    let navBarHeigth: CGFloat = 44

    let KCellId = "collectionCell"
    let KCellClass = "CollectionViewCell"

    // Data vars
    let cellModel: [(id: Int, title: String, image: String)] = [
        (id: 1, title: "Linkedin", image: "icon_linkedin"),
        (id: 2, title: "Twitter", image: "icon_twitter"),
        (id: 3, title: "Vimeo", image: "icon_vimeo"),
        (id: 4, title: "wordpress", image: "icon_wordpress"),
        (id: 5, title: "Yahoo", image: "icon_yahoo"),
        (id: 6, title: "Youtube", image: "icon_you_tube"),
        (id: 7, title: "Facebook", image: "icon_facebook"),
        (id: 8, title: "Flickr", image: "icon_flickr"),
        (id: 9, title: "Furl", image: "icon_furl"),
        (id: 10, title: "Google", image: "icon_google"),
        (id: 11, title: "My space", image: "icon_my_space"),
        (id: 12, title: "Picasa", image: "icon_picasa"),
        (id: 13, title: "Reddit", image: "icon_reddit"),
        (id: 14, title: "Skype", image: "icon_skype"),
        (id: 15, title: "Technorati", image: "icon_technorati"),
        (id: 16, title: "Tumblr", image: "icon_tumblr")
    ]

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

        containerView = PXStickyHeaderCollectionView(initHeaderHeight: initHeaderHeight, minHeaderHeight: minHeaderHeight, headerView: HeaderView())
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
        return UIEdgeInsets(top: 10, left: 8, bottom: 0, right: 8)
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}
